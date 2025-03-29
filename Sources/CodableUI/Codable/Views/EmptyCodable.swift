//
//  EmptyCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

import Foundation

public struct EmptyViewCodable: CodableView {	
	enum CodingKeys : String, CodingKey {
		case modifiers
	}
	public var modifiers: [ViewModifierCodable]
	public let id: UUID
	
	public init(minLength: CGFloatCodable? = nil) {
		self.modifiers = []
		self.id = UUID()
	}
}

extension EmptyViewCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
