//
//  ColorRBGA.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct ColorRBGA: Codable, Hashable {
	enum CodingKeys: String, CodingKey {
		case red
		case green
		case blue
		case opacity
	}
	let red: DoubleCodable
	let green: DoubleCodable
	let blue: DoubleCodable
	var opacity: DoubleCodable?
}
