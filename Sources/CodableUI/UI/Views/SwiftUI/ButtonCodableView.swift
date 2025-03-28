//
//  ButtonCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

struct ButtonCodableView: View, Identifiable {
	
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

#endif
