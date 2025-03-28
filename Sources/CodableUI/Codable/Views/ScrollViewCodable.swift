//
//  ScrollViewCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import Foundation

public struct ScrollViewCodable: CodableView {
	
	enum CodingKeys: String, CodingKey {
		case axis
		case content
		case modifiers
	}
	
	public var axis: AxisCodable
	public var content: ViewCodable
	public var modifiers: [ViewModifierCodable]
	
	public let id: UUID
	
	public init(
		_ axis: AxisCodable = .vertical,
		@ViewCodableBuilder content: () -> ViewCodable
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
		self.content = try container.decode(ViewCodable.self, forKey: .content)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(axis, forKey: .axis)
		try container.encode(content, forKey: .content)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
