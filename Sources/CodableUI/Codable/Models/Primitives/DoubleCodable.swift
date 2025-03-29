//
//  DoubleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct DoubleCodable: Codable, Hashable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Sendable {
	public typealias FloatLiteralType = Double
	public typealias IntegerLiteralType = Int
	
	let rawValue: Double
	
	public init(floatLiteral value: Double) {
		self.rawValue = value
	}
	
	public init(integerLiteral value: Int) {
		self.rawValue = Double(value)
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		do {
			let stringValue = try container.decode(String.self)
			if let double = Double(stringValue) {
				self.rawValue = double
				return
			}
		} catch DecodingError.typeMismatch {}
		self.rawValue = try container.decode(Double.self)
	}
	
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}
