//
//  ShapeCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct ShapeCodableView: Codable, Hashable, Identifiable {
	enum CodingKeys: String, CodingKey {
		case shape
		case fill
		case stroke
	}
	
	let shape: ShapeCodable
	let fill: ColorCodable?
	let stroke: StrokeCodable?
	
	let id: UUID
	
	init(shape: ShapeCodable, fill: ColorCodable? = nil, stroke: StrokeCodable? = nil) {
		self.shape = shape
		self.fill = fill
		self.stroke = stroke
		self.id = UUID()
	}
	
	static func capsule(
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .capsule(.init(style: style)),
			fill: fill,
			stroke: stroke
		)
	}
	
	static func roundedRectangle(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .roundedRectangle(.init(cornerSize: cornerSize, style: style)),
			fill: fill,
			stroke: stroke
		)
	}
	
	static func roundedRectangle(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .roundedRectangle(.init(cornerRadius: cornerRadius, style: style)),
			fill: fill,
			stroke: stroke
		)
	}
	
	static func circle(
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .circle,
			fill: fill,
			stroke: stroke
		)
	}
	
	static func rectangle(
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .rectangle,
			fill: fill,
			stroke: stroke
		)
	}
	
	static func ellipse(
		fill: ColorCodable? = nil,
		stroke: StrokeCodable? = nil
	) -> Self {
		Self.init(
			shape: .ellipse,
			fill: fill,
			stroke: stroke
		)
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.shape = try container.decode(ShapeCodable.self, forKey: .shape)
		self.fill = try container.decodeIfPresent(ColorCodable.self, forKey: .fill)
		self.stroke = try container.decodeIfPresent(StrokeCodable.self, forKey: .stroke)
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(shape, forKey: .shape)
		try container.encodeIfPresent(fill, forKey: .fill)
		try container.encodeIfPresent(stroke, forKey: .stroke)
	}
}
