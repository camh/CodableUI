//
//  CircleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

import Foundation

public struct CircleCodable: CodableShape {
	
	enum CodingKeys : String, CodingKey {
		case style
		case fill
		case stroke
		case modifiers
	}
	
	public var fill: ColorCodable?
	public var stroke: StrokeCodable?
	public var modifiers: [CodableModifier]
	public let id: UUID
	
	public init() {
		self.modifiers = []
		self.id = UUID()
	}
}

extension CircleCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fill = try container.decodeIfPresent(ColorCodable.self, forKey: .fill)
		self.stroke = try container.decodeIfPresent(StrokeCodable.self, forKey: .stroke)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(fill, forKey: .fill)
		try container.encodeIfPresent(stroke, forKey: .stroke)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
