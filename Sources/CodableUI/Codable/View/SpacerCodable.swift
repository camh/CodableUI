//
//  SpacerCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct SpacerCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case minLength
		case modifiers
	}
	
	public var minLength: CGFloatCodable?
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(minLength: CGFloatCodable? = nil) {
		self.minLength = minLength
		self.modifiers = []
		self.id = UUID()
	}
}

extension SpacerCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: SpacerCodable.CodingKeys.self)
		self.minLength = try container.decodeIfPresent(CGFloatCodable.self, forKey: .minLength)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: SpacerCodable.CodingKeys.self)
		try container.encodeIfPresent(minLength, forKey: .minLength)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
