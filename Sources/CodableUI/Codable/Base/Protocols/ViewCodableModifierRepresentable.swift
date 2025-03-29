//
//  ViewCodableModifierRepresentable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public protocol ViewCodableModifierRepresentable {
	@ViewCodableBuilder
	func body(@ViewCodableBuilder content: () -> ViewCodable) -> ViewCodable
}
