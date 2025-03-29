//
//  FontSystemCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FontSystemCodable: Codable, Hashable, Sendable {
	
	var style: FontStyleCodable
	var design: FontDesignCodable?
	var weight: FontWeightCodable?
	
	public init(style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) {
		self.style = style
		self.design = design
		self.weight = weight
	}
	
	public static func style(_ style: FontStyleCodable, design: FontDesignCodable? = nil, weight: FontWeightCodable? = nil) -> Self {
		.init(style: style, design: design, weight: weight)
	}
	
	public func weight(_ weight: FontWeightCodable) -> Self {
		var copy = self
		copy.weight = weight
		return copy
	}
	
	public func design(_ design: FontDesignCodable) -> Self {
		var copy = self
		copy.design = design
		return copy
	}
	
	public func bold() -> Self {
		weight(.bold)
	}
	
	public static var largeTitle: Self {
		.init(style: .largeTitle)
	}
	public static var title: Self {
		.init(style: .title)
	}
	public static var title2: Self {
		.init(style: .title2)
	}
	public static var title3: Self {
		.init(style: .title3)
	}
	public static var headline: Self {
		.init(style: .headline)
	}
	public static var subheadline: Self {
		.init(style: .subheadline)
	}
	public static var body: Self {
		.init(style: .body)
	}
	public static var callout: Self {
		.init(style: .callout)
	}
	public static var caption: Self {
		.init(style: .caption)
	}
	public static var caption2: Self {
		.init(style: .caption2)
	}
	public static var footnote: Self {
		.init(style: .footnote)
	}
}
