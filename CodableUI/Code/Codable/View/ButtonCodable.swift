//
//  ButtonCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import Foundation

struct ButtonActionCodable: Codable, Hashable, Identifiable {
	var name: String
	var value: String?
	
	var id: String {
		if let value {
			name + ":" + value
		} else {
			name
		}
	}
	
	init(name: String, value: String? = nil) {
		self.name = name
		self.value = value
	}
	
	static func name(_ name: String, value: String? = nil) -> ButtonActionCodable {
		.init(name: name, value: value)
	}
}

struct ButtonCodable: Codable, Hashable {
	
	enum CodingKeys: String, CodingKey {
		case action
		case label
	}
	
	var action: ButtonActionCodable?
	var label: CodableView
	
	let id: UUID
	
	init(action: ButtonActionCodable? = nil, label: CodableView) {
		self.action = action
		self.label = label
		self.id = UUID()
	}
	
	static func action(_ action: ButtonActionCodable, label: CodableView) -> Self {
		.init(action: action, label: label)
	}
}

extension ButtonCodable {
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.action = try container.decodeIfPresent(ButtonActionCodable.self, forKey: .action)
		self.label = try container.decode(CodableView.self, forKey: .label)
		self.id = UUID()
	}
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(action, forKey: .action)
		try container.encode(label, forKey: .label)
	}
}
