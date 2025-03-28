//
//  TextCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public enum TextTypeCodable: Codable, Hashable, Sendable {
	case plain(String)
	case markdown(String)
}

public struct TextCodable: CodableView {
	
	enum CodingKeys: String, CodingKey {
		case textType
		case modifiers
	}
	
	public var textType: TextTypeCodable
	public var modifiers: [ViewModifierCodable]
	
	public let id: UUID
	
	public init(_ text: String) {
		self.textType = .plain(text)
		self.modifiers = []
		self.id = UUID()
	}
	
	public init(markdown: String) {
		self.textType = .markdown(markdown)
		self.modifiers = []
		self.id = UUID()
	}
}

extension TextCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.textType = try container.decode(TextTypeCodable.self, forKey: .textType)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(textType, forKey: .textType)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
