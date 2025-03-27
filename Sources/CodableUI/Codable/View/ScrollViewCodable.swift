//
//  ScrollViewCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import Foundation

public struct ScrollViewCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case axis
		case content
		case modifiers
	}
	
	public var axis: AxisCodable
	public var content: CodableView
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		_ axis: AxisCodable = .vertical,
		@CodableViewBuilder content: () -> CodableView
	) {
		self.axis = axis
		self.content = content()
		self.modifiers = []
		self.id = UUID()
	}
}

extension ScrollViewCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.axis = try container.decode(AxisCodable.self, forKey: .axis)
		self.content = try container.decode(CodableView.self, forKey: .content)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(axis, forKey: .axis)
		try container.encode(content, forKey: .content)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
