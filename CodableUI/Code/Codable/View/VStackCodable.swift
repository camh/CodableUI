//
//  VStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct VStackCodable: Codable, Hashable {
	
	enum CodingKeys: String, CodingKey {
		case alignment
		case spacing
		case children
	}
	
	var alignment: HorizontalAlignmentCodable?
	var spacing: CGFloatCodable?
	var children: [CodableView]
	
	let id: UUID
	
	init(
		alignment: HorizontalAlignmentCodable? = nil,
		spacing: CGFloatCodable? = nil,
		children: [CodableView] = []
	) {
		self.alignment = alignment
		self.spacing = spacing
		self.children = children
		self.id = UUID()
	}
	
	static func alignment(_ alignment: HorizontalAlignmentCodable) -> Self {
		.init(alignment: alignment)
	}
	
	static func spacing(_ spacing: CGFloat) -> Self {
		.init(spacing: .init(spacing))
	}
	
	static func children(_ children: [CodableView]) -> Self {
		.init(children: children)
	}
	
	func alignment(_ alignment: HorizontalAlignmentCodable) -> Self {
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

extension VStackCodable {
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.alignment = try container.decodeIfPresent(HorizontalAlignmentCodable.self, forKey: .alignment)
		self.spacing = try container.decodeIfPresent(CGFloatCodable.self, forKey: .spacing)
		self.children = try container.decode([CodableView].self, forKey: .children)
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encodeIfPresent(spacing, forKey: .spacing)
		try container.encode(children, forKey: .children)
	}
}
