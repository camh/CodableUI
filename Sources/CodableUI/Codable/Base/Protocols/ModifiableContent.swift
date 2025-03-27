//
//  ModifiableContent.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

public protocol ModifiableContent {
	var modifiers: [CodableModifier] { get set }
	func setModifiers(_ modifiers: CodableModifier...) -> Self
	func addModifiers(_ modifiers: CodableModifier...) -> Self
	func addModifier(_ modifier: CodableModifier) -> Self
}

public extension ModifiableContent {
	func setModifiers(_ modifiers: CodableModifier...) -> Self {
		var copy = self
		copy.modifiers = modifiers
		return copy
	}
	
	func addModifiers(_ modifiers: CodableModifier...) -> Self {
		var copy = self
		copy.modifiers = copy.modifiers + modifiers
		return copy
	}
	
	func addModifier(_ modifier: CodableModifier) -> Self {
		var copy = self
		copy.modifiers = copy.modifiers + [modifier]
		return copy
	}
}
