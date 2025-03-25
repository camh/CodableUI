//
//  TextCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct TextCodable: Codable, Hashable {
	
	enum CodingKeys: String, CodingKey {
		case text
	}
	
	var text: String
	var id: UUID
	
	static func text(_ text: String) -> TextCodable {
		.init(text: text)
	}
	
	init (text: String) {
		self.text = text
		self.id = UUID()
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.text = try container.decode(String.self, forKey: .text)
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(text, forKey: .text)
	}
}
