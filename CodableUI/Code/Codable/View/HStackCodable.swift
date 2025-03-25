//
//  HStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct HStackCodable: Codable, Hashable, Identifiable {
	
	enum CodingKeys : String, CodingKey {
		case alignment
		case spacing
		case children
	}
	
	var alignment: VerticalAlignmentCodable?
	var spacing: CGFloatCodable?
	var children: [CodableView]
	
	let id: UUID
	
	init(alignment: VerticalAlignmentCodable? = nil, spacing: CGFloatCodable? = nil, children: [CodableView] = []) {
		self.alignment = alignment
		self.spacing = spacing
		self.children = children
		self.id = UUID()
	}
	
	static func alignment(_ alignment: VerticalAlignmentCodable) -> Self {
		.init(alignment: alignment)
	}
	
	static func spacing(_ spacing: CGFloat) -> Self {
		.init(spacing: .init(spacing))
	}
	
	static func children(_ children: [CodableView]) -> Self {
		.init(children: children)
	}
	
	func alignment(_ alignment: VerticalAlignmentCodable) -> Self {
		var selfCopy = self
		selfCopy.alignment = alignment
		return selfCopy
	}
	
	func spacing(_ spacing: CGFloat) -> Self {
		var selfCopy = self
		selfCopy.spacing = .init(spacing)
		return selfCopy
	}
	
	func children(_ children: [CodableView]) -> Self {
		var selfCopy = self
		selfCopy.children = children
		return selfCopy
	}
}

extension HStackCodable {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		alignment = try container.decodeIfPresent(VerticalAlignmentCodable.self, forKey: .alignment)
		spacing = try container.decodeIfPresent(CGFloatCodable.self, forKey: .spacing)
		children = try container.decode([CodableView].self, forKey: .children)
		id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encodeIfPresent(spacing, forKey: .spacing)
		try container.encode(children, forKey: .children)
	}
}
