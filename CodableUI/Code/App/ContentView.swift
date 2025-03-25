//
//  ContentView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

struct BasicView: View {
	@State private var codableView: CodableView?
	
	var body: some View {
		ScrollView {
			if let codableView {
				codableView
			} else {
				ProgressView()
			}
		}  
		.task {
			self.codableView = try? await getCodableView()
		}
	}
	
	nonisolated func getCodableView() async throws -> CodableView {
		let view = await self.basicCodableView
		let encoded = try JSONEncoder().encode(view)
		print(String(data: encoded, encoding: .utf8) ?? "Error encoding")
		print("\n\n+++++++++++++\n\n")
		let decodedView = try JSONDecoder().decode(CodableView.self, from: encoded)
		return decodedView
	}
	
	var basicCodableView: CodableView {
		.content(
			.hStack(
				.children([
					.content(.image(.systemName("globe"))),
					.content(.text("Hello, world!"))
				])
			),
			modifiers: [
				.padding(.all(20)),
				.backgroundColor(.white(0.8))
			]
		)
	}
}

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
	@State private var buttonAction: ButtonActionCodable?
	
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
		.environment(\.codableButtonAction) { [$buttonAction] action  in
			$buttonAction.wrappedValue = action
		}
		.alert(item: $buttonAction) { action in
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

#Preview("Basic view") {
	BasicView()
}
