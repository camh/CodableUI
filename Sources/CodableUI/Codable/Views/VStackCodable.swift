//
//  VStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct VStackCodable: CodableView {
	
	enum CodingKeys: String, CodingKey {
		case alignment
		case spacing
		case children
		case modifiers
	}
	
	public var alignment: HorizontalAlignmentCodable?
	public var spacing: CGFloatCodable?
	public var children: [ViewCodable]
	public var modifiers: [ViewModifierCodable]
	
	public let id: UUID
	
	public init(
		alignment: HorizontalAlignmentCodable? = nil,
		spacing: CGFloatCodable? = nil,
		@ChildrenViewBuilder children: () -> [ViewCodable]
	) {
		self.alignment = alignment
		self.spacing = spacing
		self.children = children()
		self.modifiers = []
		self.id = UUID()
	}
}

extension VStackCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.alignment = try container.decodeIfPresent(HorizontalAlignmentCodable.self, forKey: .alignment)
		self.spacing = try container.decodeIfPresent(CGFloatCodable.self, forKey: .spacing)
		self.children = try container.decode([ViewCodable].self, forKey: .children)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encodeIfPresent(spacing, forKey: .spacing)
		try container.encode(children, forKey: .children)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
