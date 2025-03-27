//
//  CGFloatCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct CGFloatCodable: Codable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Hashable, Sendable {
	public typealias FloatLiteralType = Double
	public typealias IntegerLiteralType = Int
	
	let rawValue: CGFloat
	
	init(_ rawValue: CGFloat) {
		self.rawValue = rawValue
	}
	
	public init(floatLiteral value: Double) {
		self.rawValue = CGFloat(value)
	}
	
	public init(integerLiteral value: Int) {
		self.rawValue = CGFloat(value)
	}
	
	public static var infinity: Self {
		.init(.infinity)
	}
	
	public init(from decoder: any Decoder) throws {
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
	
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		if rawValue == .infinity {
			try container.encode("infinity")
		} else {
			try container.encode(self.rawValue)
		}
	}
}
