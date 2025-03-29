//
//  ModifiableContent+ViewCodableModifierRepresentable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public extension ModifiableContent {
	func modifier<Modifier: ViewCodableModifierRepresentable>(
		_ modifier: Modifier
	) -> Self {
		let content = ViewCodable.empty(EmptyViewCodable())
		let body = modifier.body { content }
		return self.addModifiers(body.modifiers)
	}
}
