//
//  ButtonCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI

extension ButtonCodable: View {
	public var body: some View {
		CodableButton(buttonCodable: self)
	}
}

struct CodableButton: View, Identifiable {
	
	let buttonCodable: ButtonCodable
	@Environment(\.codableActionHandler) private var actionHandler
	
	let id = UUID()
	
	var body: some View {
		Button {
			if let action = buttonCodable.action{
				Task { await actionHandler(action) }
			}
		} label: {
			buttonCodable.label.body
		}
	}
}
