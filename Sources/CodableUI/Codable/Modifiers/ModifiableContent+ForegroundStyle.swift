//
//  ModifiableContent+ForegroundStyle.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func foregroundStyle(_ color: ColorCodable) -> Self {
		addModifier(.foregroundColor(color))
	}
	public func foregroundStyle(light: ColorCodable, dark: ColorCodable) -> Self {
		let colorType = ColorCodableType.dynamic(light: light.colorType, dark: dark.colorType)
		return addModifier(.foregroundColor(ColorCodable(colorType)))
	}
}
