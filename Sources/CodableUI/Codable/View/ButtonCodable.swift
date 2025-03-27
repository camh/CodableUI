//
//  ButtonCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import Foundation

public struct ButtonCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case action
		case label
		case modifiers
	}
	
	public var action: ActionCodable?
	public var label: CodableView
	
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		action: () -> ActionCodable?,
		@CodableViewBuilder label: () -> CodableView
	) {
		self.action = action()
		self.label = label()
		self.modifiers = []
		self.id = UUID()
	}
}

extension ButtonCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.action = try container.decodeIfPresent(ActionCodable.self, forKey: .action)
		self.label = try container.decode(CodableView.self, forKey: .label)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(action, forKey: .action)
		try container.encode(label, forKey: .label)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
