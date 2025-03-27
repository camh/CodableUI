//
//  ProgressViewCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct ProgressViewCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case modifiers
	}
	
	public var modifiers: [CodableModifier]
	public let id: UUID
	
	public init() {
		self.modifiers = []
		self.id = UUID()
	}
}

extension ProgressViewCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
