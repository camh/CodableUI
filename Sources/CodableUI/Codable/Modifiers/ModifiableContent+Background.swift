//
//  ModifiableContent+Background.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func background(_ color: ColorCodable) -> Self {
		addModifier(.backgroundColor(color))
	}
	public func background(light: ColorCodable, dark: ColorCodable) -> Self {
		let color = ColorCodable(light: light, dark: dark)
		return addModifier(.backgroundColor(color))
	}
}

extension ModifiableContent {
	public func background(
		@ViewCodableBuilder _ view: () -> ViewCodable
	) -> Self {
		addModifier(.backgroundView(view()))
	}
}
