//
//  FontSystemCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FontSystemCodable: Codable, Hashable, Sendable {
	let style: FontStyleCodable
	let design: FontDesignCodable?
	let weight: FontWeightCodable?
	
	public init(style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) {
		self.style = style
		self.design = design
		self.weight = weight
	}
	
	public static func style(_ style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) -> Self {
		.init(style: style, design: design, weight: weight)
	}
	
	public func weight(_ weight: FontWeightCodable) -> Self {
		.init(
			style: self.style,
			design: self.design,
			weight: weight
		)
	}
	
	public func bold() -> Self {
		weight(.bold)
	}
}
