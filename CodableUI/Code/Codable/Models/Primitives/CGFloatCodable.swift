//
//  CGFloatCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct CGFloatCodable: Codable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Hashable {
	typealias FloatLiteralType = Double
	typealias IntegerLiteralType = Int
	
	let rawValue: CGFloat
	
	init(_ rawValue: CGFloat) {
		self.rawValue = rawValue
	}
	
	init(floatLiteral value: Double) {
		self.rawValue = CGFloat(value)
	}
	
	init(integerLiteral value: Int) {
		self.rawValue = CGFloat(value)
	}
	
	static var infinity: Self {
		.init(.infinity)
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		do {
			let stringValue = try container.decode(String.self)
			if stringValue == "infinity" {
				self.rawValue = .infinity
				return
			} else if let double = Double(stringValue) {
				self.rawValue = CGFloat(double)
				return
			}
		} catch DecodingError.typeMismatch {}
		self.rawValue = try container.decode(CGFloat.self)
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		if rawValue == .infinity {
			try container.encode("infinity")
		} else {
			try container.encode(self.rawValue)
		}
	}
}
