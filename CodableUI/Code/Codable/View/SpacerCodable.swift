//
//  SpacerCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct SpacerCodable: Codable, Hashable, Identifiable {
	
	enum CodingKeys: String, CodingKey {
		case minLength
	}
	
	let minLength: CGFloatCodable?
	let id: UUID
	
	static var `default`: SpacerCodable {
		.init()
	}
	
	static func minLength(_ minLength: CGFloatCodable) -> SpacerCodable {
		.init(minLength: minLength)
	}
	
	init(minLength: CGFloatCodable? = nil) {
		self.minLength = minLength
		self.id = UUID()
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: SpacerCodable.CodingKeys.self)
		self.minLength = try container.decodeIfPresent(CGFloatCodable.self, forKey: .minLength)
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: SpacerCodable.CodingKeys.self)
		try container.encodeIfPresent(minLength, forKey: .minLength)
	}
}
