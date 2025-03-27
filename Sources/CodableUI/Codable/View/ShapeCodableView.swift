//
//  ShapeCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct ShapeCodableView: ViewCodable {
	enum CodingKeys: String, CodingKey {
		case shape
		case fill
		case stroke
		case modifiers
	}
	
	public var shape: ShapeCodable
	public var fill: ColorCodable?
	public var stroke: StrokeCodable?
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		_ shape: ShapeCodable,
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) {
		self.shape = shape
		self.fill = fill
		self.stroke = stroke
		self.modifiers = []
		self.id = UUID()
	}
	
	public func fill(_ color: ColorCodable) -> Self {
		var copy = self
		copy.fill = color
		return copy
	}
	
	public func stroke(_ color: ColorCodable) -> Self {
		let stroke = StrokeCodable(color: color, strokeStyle: .init())
		return self.stroke(stroke)
	}
	
	public func stroke(_ color: ColorCodable, lineWidth: CGFloatCodable) -> Self {
		let stroke = StrokeCodable(color: color, strokeStyle: .init(lineWidth: lineWidth))
		return self.stroke(stroke)
	}
	
	public func stroke(_ stroke: StrokeCodable) -> Self {
		var copy = self
		copy.stroke = stroke
		return copy
	}
}

extension ShapeCodableView {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.shape = try container.decode(ShapeCodable.self, forKey: .shape)
		self.fill = try container.decodeIfPresent(ColorCodable.self, forKey: .fill)
		self.stroke = try container.decodeIfPresent(StrokeCodable.self, forKey: .stroke)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(shape, forKey: .shape)
		try container.encodeIfPresent(fill, forKey: .fill)
		try container.encodeIfPresent(stroke, forKey: .stroke)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
