//
//  CodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct CodableView: Codable, Hashable, Identifiable, Sendable {
	var content: CodableContent
	var modifiers: [CodableModifier]
	
	init(content: CodableContent, modifiers: [CodableModifier] = []) {
		self.content = content
		self.modifiers = modifiers
	}
	
	static func content(
		_ content: CodableContent,
		modifiers: [CodableModifier] = []
	) -> CodableView {
		.init(content: content, modifiers: modifiers)
	}
	
	var id: UUID {
		content.id
	}
}
