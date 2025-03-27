//
//  HStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct HStackCodable: ViewCodable {
	
	enum CodingKeys : String, CodingKey {
		case alignment
		case spacing
		case children
		case modifiers
	}
	
	public var alignment: VerticalAlignmentCodable?
	public var spacing: CGFloatCodable?
	public var children: [CodableView]
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		alignment: VerticalAlignmentCodable? = nil,
		spacing: CGFloatCodable? = nil,
		@ChildrenViewBuilder children: () -> [CodableView]
	) {
		self.alignment = alignment
		self.spacing = spacing
		self.children = children()
		self.modifiers = []
		self.id = UUID()
	}
}

extension HStackCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		alignment = try container.decodeIfPresent(VerticalAlignmentCodable.self, forKey: .alignment)
		spacing = try container.decodeIfPresent(CGFloatCodable.self, forKey: .spacing)
		children = try container.decode([CodableView].self, forKey: .children)
		modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encodeIfPresent(spacing, forKey: .spacing)
		try container.encode(children, forKey: .children)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
