//
//  ButtonCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI

struct CodableButtonActionKey: EnvironmentKey {
	static let defaultValue: @Sendable (ButtonActionCodable) async -> () = { _ in }
}

extension EnvironmentValues {
	var codableButtonAction: @Sendable (ButtonActionCodable) async -> () {
		get { self[CodableButtonActionKey.self] }
		set { self[CodableButtonActionKey.self] = newValue }
	}
}

extension View {
	func onCodableButtonAction(
		_ action: @escaping @Sendable (ButtonActionCodable) async -> ()
	) -> some View {
		self.environment(\.codableButtonAction, action)
	}
}

extension ButtonCodable: View {
	var body: some View {
		CodableButton(buttonCodable: self)
	}
}

struct CodableButton: View, Identifiable {
	
	let buttonCodable: ButtonCodable
	@Environment(\.codableButtonAction) private var buttonAction
	
	let id = UUID()
	
	var body: some View {
		Button {
			if let action = buttonCodable.action{
				Task { await buttonAction(action) }
			}
		} label: {
			buttonCodable.label.body
		}
	}
}
