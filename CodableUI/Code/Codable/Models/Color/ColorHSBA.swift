//
//  ColorHSBA.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct ColorHSBA: Codable, Hashable {
	enum CodingKeys: String, CodingKey {
		case hue
		case saturation
		case brightness
		case opacity
	}
	let hue: DoubleCodable
	let saturation: DoubleCodable
	let brightness: DoubleCodable
	var opacity: DoubleCodable?
}
