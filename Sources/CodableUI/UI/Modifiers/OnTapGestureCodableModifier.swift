//
//  OnTapGestureCodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

struct OnTapGestureCodableModifier: ViewModifier {
	
	let actionCodable: ActionCodable?
	@Environment(\.codableActionHandler) private var actionHandler
	
	func body(content: Content) -> some View {
		content.onTapGesture {
			if let actionCodable = actionCodable {
				Task { await actionHandler(actionCodable) }
			}
		}
	}
}
