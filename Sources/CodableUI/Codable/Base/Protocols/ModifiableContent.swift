//
//  ModifiableContent.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

public protocol ModifiableContent {
	var modifiers: [ViewModifierCodable] { get set }
	func addModifiers(_ modifiers: [ViewModifierCodable]) -> Self
	func addModifier(_ modifier: ViewModifierCodable) -> Self
}

public extension ModifiableContent {
	func addModifiers(_ modifiers: [ViewModifierCodable]) -> Self {
		var copy = self
		copy.modifiers = copy.modifiers + modifiers
		return copy
	}
	
	func addModifier(_ modifier: ViewModifierCodable) -> Self {
		var copy = self
		copy.modifiers = copy.modifiers + [modifier]
		return copy
	}
}
