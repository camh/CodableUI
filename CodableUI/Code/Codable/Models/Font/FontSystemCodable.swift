//
//  FontSystemCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FontSystemCodable: Codable, Hashable {
	let style: FontStyleCodable
	let design: FontDesignCodable?
	let weight: FontWeightCodable?
	
	init(style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) {
		self.style = style
		self.design = design
		self.weight = weight
	}
	
	static func style(_ style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) -> Self {
		.init(style: style, design: design, weight: weight)
	}
	
	func weight(_ weight: FontWeightCodable) -> Self {
		.init(
			style: self.style,
			design: self.design,
			weight: weight
		)
	}
	
	func bold() -> Self {
		weight(.bold)
	}
}
