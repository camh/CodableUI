//
//  ModifiableContent+Overlay.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

extension ModifiableContent {
	public func overlay(_ color: ColorCodable) -> Self {
		addModifier(.overlayColor(color))
	}
}

extension ModifiableContent {
	public func overlay(
		@ViewCodableBuilder _ view: () -> ViewCodable
	) -> Self {
		addModifier(.overlay(view()))
	}
}
