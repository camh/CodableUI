//
//  RoundedRectangleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct RoundedRectangleCodable: CodableShape {
	
	enum CodingKeys : String, CodingKey {
		case cornerSize
		case style
		case fill
		case stroke
		case modifiers
	}
	
	public var cornerSize: CGSize
	public var style: RoundedCornerStyleCodable
	
	public var fill: ColorCodable?
	public var stroke: StrokeCodable?
	
	public var modifiers: [CodableModifier]
	public let id: UUID
	
	public init(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = cornerSize
		self.style = style
		self.modifiers = []
		self.id = UUID()
	}
	
	public init(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = CGSize(
			width: cornerRadius.rawValue,
			height: cornerRadius.rawValue
		)
		self.style = style
		self.modifiers = []
		self.id = UUID()
	}
}

extension RoundedRectangleCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.cornerSize = try container.decode(CGSize.self, forKey: .cornerSize)
		self.style = try container.decode(RoundedCornerStyleCodable.self, forKey: .style)
		self.fill = try container.decodeIfPresent(ColorCodable.self, forKey: .fill)
		self.stroke = try container.decodeIfPresent(StrokeCodable.self, forKey: .stroke)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(cornerSize, forKey: .cornerSize)
		try container.encode(style, forKey: .style)
		try container.encodeIfPresent(fill, forKey: .fill)
		try container.encodeIfPresent(stroke, forKey: .stroke)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
