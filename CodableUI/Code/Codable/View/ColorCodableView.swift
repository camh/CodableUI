//
//  ColorCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct ColorCodableView: Codable, Hashable {
	
	enum CodingKeys: String, CodingKey {
		case color
	}
	
	let color: ColorCodable
	let id: UUID
	
	init(color: ColorCodable) {
		self.color = color
		self.id = UUID()
	}
	
	static func color(_ color: ColorCodable) -> Self {
		Self.init(color: color)
	}
	
	static func white(_ colorWhite: ColorWhite) -> Self {
		Self.init(color: .white(colorWhite))
	}
	
	static func dynamic(light: ColorCodable, dark: ColorCodable) -> Self {
		Self.init(color: .dynamic(light: light, dark: dark))
	}
	
	static func hex(_ hex: String) -> Self {
		Self.init(color: .hex(hex))
	}
}

extension ColorCodableView {
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.color = try container.decode(ColorCodable.self, forKey: .color)
		self.id = UUID()
	}
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(color, forKey: .color)
	}
}
