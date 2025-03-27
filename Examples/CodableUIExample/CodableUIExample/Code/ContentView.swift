//
//  ContentView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI
import CodableUI

struct ContentView: View {
	var body: some View {
		List {
			ForEach(CodableUIBuilder.Kind.allCases) { kind in
				NavigationLink {
					CodableKindView(kind: kind)
				} label: {
					Text(kind.rawValue)
				}
			}
		}
	}
}

struct CodableKindView: View {
	
	let kind: CodableUIBuilder.Kind
	
	@State private var codableView: CodableView?
	@State private var action: ActionCodable?
	
	var body: some View {
		ScrollView {
			if let codableView {
				codableView
			} else {
				VStack {
					ProgressView()
					Text("Loading...")
				}
			}
		}
		.environment(\.codableActionHandler) { [$action] action  in
			$action.wrappedValue = action
		}
		.alert(item: $action) { action in
			Alert(
				title: Text("You tapped a button"),
				message: Text("You tapped \"\(action.name)\" with the value \"\(action.value ?? "")\""),
				dismissButton: .cancel(Text("Close"))
			)
		}
		.task {
			do {
				codableView = try await CodableUIBuilder().getCodableView(for: kind)
			} catch {
				print(error)
			}
		}
	}
}

#Preview {
	NavigationStack {
		ContentView()
	}
}
