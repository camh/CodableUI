//
//  ZStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct ZStackCodable: ViewCodable {
	
	enum CodingKeys : String, CodingKey {
		case alignment
		case children
		case modifiers
	}
	
	public var alignment: AlignmentCodable?
	public var children: [CodableView]
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		alignment: AlignmentCodable? = nil,
		@ChildrenViewBuilder children: () -> [CodableView]
	) {
		self.alignment = alignment
		self.children = children()
		self.modifiers = []
		self.id = UUID()
	}
}

extension ZStackCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.alignment = try container.decodeIfPresent(AlignmentCodable.self, forKey: .alignment)
		self.children = try container.decode([CodableView].self, forKey: .children)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encode(children, forKey: .children)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
