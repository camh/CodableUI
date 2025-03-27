//
//  DoubleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct DoubleCodable: Codable, Hashable, ExpressibleByFloatLiteral, Sendable {
	public typealias FloatLiteralType = Double
	
	let rawValue: Double
	
	public init(floatLiteral value: Double) {
		self.rawValue = value
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
