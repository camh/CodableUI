//
//  ColorWhiteCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct ColorWhiteCodable: Codable, Hashable, ExpressibleByFloatLiteral, Sendable {
	
	public typealias FloatLiteralType = Double
	
	let white: DoubleCodable
	let opacity: DoubleCodable?
	
	public init(floatLiteral value: Double) {
		self.init(white: DoubleCodable(floatLiteral: value))
	}
	
	public init(white: DoubleCodable, opacity: DoubleCodable? = nil) {
		self.white = white
		self.opacity = opacity
	}
	
	public static func white(_ white: DoubleCodable, opacity: DoubleCodable? = nil) -> Self {
		.init(white: white, opacity: opacity)
	}
}

