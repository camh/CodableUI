//
//  ColorWhite.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct ColorWhite: Codable, Hashable, ExpressibleByFloatLiteral {
	
	typealias FloatLiteralType = Double
	
	let white: DoubleCodable
	let opacity: DoubleCodable?
	
	init(floatLiteral value: Double) {
		self.init(white: DoubleCodable(floatLiteral: value))
	}
	
	init(white: DoubleCodable, opacity: DoubleCodable? = nil) {
		self.white = white
		self.opacity = opacity
	}
	
	static func white(_ white: DoubleCodable, opacity: DoubleCodable? = nil) -> Self {
		.init(white: white, opacity: opacity)
	}
}

