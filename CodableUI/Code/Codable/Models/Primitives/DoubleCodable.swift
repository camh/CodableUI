//
//  DoubleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct DoubleCodable: Codable, Hashable, ExpressibleByFloatLiteral {
	typealias FloatLiteralType = Double
	
	let rawValue: Double
	
	init(floatLiteral value: Double) {
		self.rawValue = value
	}
	
	init(from decoder: any Decoder) throws {
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
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}
