//
//  CapsuleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct CapsuleCodable: CodableShape {
	
	enum CodingKeys : String, CodingKey {
		case style
		case fill
		case stroke
		case modifiers
	}
	
	public var style: RoundedCornerStyleCodable
	public var fill: ColorCodable?
	public var stroke: StrokeCodable?
	
	public var modifiers: [ViewModifierCodable]
	
	public let id: UUID
	
	public init(style: RoundedCornerStyleCodable = .continuous) {
		self.style = style
		self.modifiers = []
		self.id = UUID()
	}
}

extension CapsuleCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.style = try container.decode(RoundedCornerStyleCodable.self, forKey: .style)
		self.fill = try container.decodeIfPresent(ColorCodable.self, forKey: .fill)
		self.stroke = try container.decodeIfPresent(StrokeCodable.self, forKey: .stroke)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(style, forKey: .style)
		try container.encodeIfPresent(fill, forKey: .fill)
		try container.encodeIfPresent(stroke, forKey: .stroke)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
