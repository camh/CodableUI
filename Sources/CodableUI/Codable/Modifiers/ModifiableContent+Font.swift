//
//  ModifiableContent+Font.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func font(
		_ style: FontStyleCodable,
		design: FontDesignCodable? = nil,
		weight: FontWeightCodable? = nil
	) -> Self {
		addModifier(
			.font(
				.systemStyle(.style(style, design: design, weight: weight))
			)
		)
	}
	public func font(_ systemStyle: FontSystemCodable) -> Self {
		addModifier(.font(.systemStyle(systemStyle)))
	}
	public func font(_ font: FontCodable) -> Self {
		addModifier(.font(font))
	}
}
