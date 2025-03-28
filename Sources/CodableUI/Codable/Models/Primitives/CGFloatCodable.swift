//
//  CGFloatCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public typealias CGFloatCoablePrimitive = Double

public struct CGFloatCodable: Codable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Hashable, Sendable {
	public typealias FloatLiteralType = CGFloatCoablePrimitive
	public typealias IntegerLiteralType = Int
	
	let rawValue: CGFloatCoablePrimitive
	
	init(_ rawValue: CGFloatCoablePrimitive) {
		print(type(of: CGFloatCoablePrimitive.self))
		self.rawValue = CGFloatCoablePrimitive(rawValue)
	}
	
	public init(floatLiteral value: CGFloatCoablePrimitive) {
		self.rawValue = CGFloatCoablePrimitive(value)
	}
	
	public init(integerLiteral value: Int) {
		self.rawValue = CGFloatCoablePrimitive(value)
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
			} else if let primitive = CGFloatCoablePrimitive(stringValue) {
				self.rawValue = primitive
				return
			}
		} catch DecodingError.typeMismatch {}
		self.rawValue = try container.decode(CGFloatCoablePrimitive.self)
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
