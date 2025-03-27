//
//  ToolbarItemCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import Foundation

public struct ToolbarItemCodable: Codable, Hashable, Identifiable, Sendable {
	
	enum CodingKeys: String, CodingKey {
		case placement
		case content
	}
	
	let placement: ToolbarItemPlacementCodable
	let content: CodableView
	
	public let id: UUID
	
	public init(
		placement: ToolbarItemPlacementCodable = .automatic,
		content: CodableView
	) {
		self.placement = placement
		self.content = content
		self.id = UUID()
	}
	
	public init(
		placement: ToolbarItemPlacementCodable = .automatic,
		content: () -> CodableView
	) {
		self.placement = placement
		self.content = content()
		self.id = UUID()
	}
}

extension ToolbarItemCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.placement = try container.decode(ToolbarItemPlacementCodable.self, forKey: .placement)
		self.content = try container.decode(CodableView.self, forKey: .content)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(placement, forKey: .placement)
		try container.encode(content, forKey: .content)
	}
}
