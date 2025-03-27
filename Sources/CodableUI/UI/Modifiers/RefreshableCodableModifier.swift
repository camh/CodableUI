//
//  RefreshableCodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

struct RefreshableCodableModifier: ViewModifier {
	
	let actionCodable: ActionCodable?
	@Environment(\.codableActionHandler) private var actionHandler
	
	func body(content: Content) -> some View {
		content.refreshable {
			guard let actionCodable else { return }
			Task { await actionHandler(actionCodable) }
		}
	}
}
