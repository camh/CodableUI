//
//  FontCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public enum FontCodable: Codable, Hashable, Sendable {
	case systemStyle(FontSystemCodable)
	case systemFixed(FontSystemFixedCodable)
	case customStyle(FontCustomCodable)
	case customFixed(FontCustomFixedCodable)
	
	public static func system(
		_ style: FontStyleCodable,
		design: FontDesignCodable? = nil,
		weight: FontWeightCodable? = nil
	) -> Self {
		.systemStyle(.init(style: style, design: design, weight: weight))
	}
	
	public static func system(
		size: CGFloatCodable,
		weight: FontWeightCodable? = nil
	) -> Self {
		.systemFixed(.init(size: size, weight: weight, design: nil))
	}
}
