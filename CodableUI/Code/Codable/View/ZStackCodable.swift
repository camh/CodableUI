//
//  ZStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct ZStackCodable: Codable, Hashable, Identifiable {
	
	enum CodingKeys : String, CodingKey {
		case alignment
		case children
	}
	
	var alignment: AlignmentCodable?
	var children: [CodableView]
	
	let id: UUID
	
	init(alignment: AlignmentCodable? = nil, children: [CodableView] = []) {
		self.alignment = alignment
		self.children = children
		self.id = UUID()
	}
	
	static func alignment(_ alignment: AlignmentCodable) -> Self {
		.init(alignment: alignment)
	}
	
	static func children(_ children: [CodableView]) -> Self {
		.init(children: children)
	}
	
	func alignment(_ alignment: AlignmentCodable) -> Self {
		var selfCopy = self
		selfCopy.alignment = alignment
		return selfCopy
	}
	
	func children(_ children: [CodableView]) -> Self {
		var selfCopy = self
		selfCopy.children = children
		return selfCopy
	}
}

extension ZStackCodable {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		alignment = try container.decodeIfPresent(AlignmentCodable.self, forKey: .alignment)
		children = try container.decode([CodableView].self, forKey: .children)
		id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(alignment, forKey: .alignment)
		try container.encode(children, forKey: .children)
	}
}
