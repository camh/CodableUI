//
//  ImageCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct ImageCodableView: Codable, Hashable, Identifiable {
	
	enum CodingKeys: String, CodingKey {
		case image
		case resizable
	}
	
	var image: ImageCodable
	var resize: ImageResizeCodable?
	
	let id: UUID
	
	static func name(_ name: String) -> Self {
		.init(image: .name(name))
	}
	
	static func systemName(_ name: String) -> Self {
		.init(image: .systemName(name))
	}
	
	func resizable(capInsets: EdgeInsetsCodable? = nil, resizingMode: ImageResizingModeCodable? = nil) -> Self {
		var copy = self
		copy.resize = .init(capInsets: capInsets, resizingMode: resizingMode)
		return copy
	}
	
	init(image: ImageCodable, resizable: ImageResizeCodable? = nil) {
		self.image = image
		self.resize = resizable
		self.id = UUID()
	}
}

extension ImageCodableView {
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.image = try container.decode(ImageCodable.self, forKey: .image)
		self.resize = try container.decodeIfPresent(ImageResizeCodable.self, forKey: .resizable)
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(image, forKey: .image)
		try container.encodeIfPresent(resize, forKey: .resizable)
	}
}
