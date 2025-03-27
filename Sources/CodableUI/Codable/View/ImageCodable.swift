//
//  ImageCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct ImageCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case imageType
		case resizable
		case modifiers
	}
	
	public var imageType: ImageTypeCodable
	public var resize: ImageResizeCodable?
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		_ imageType: ImageTypeCodable,
		resizable: ImageResizeCodable? = nil
	) {
		self.imageType = imageType
		self.resize = resizable
		self.modifiers = []
		self.id = UUID()
	}
	
	public init(_ name: String) {
		self.init(.name(name))
	}
	
	public init(systemName: String) {
		self.init(.systemName(systemName))
	}
	
	public func resizable() -> Self {
		var copy = self
		copy.resize = .init()
		return copy
	}
}

extension ImageCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.imageType = try container.decode(ImageTypeCodable.self, forKey: .imageType)
		self.resize = try container.decodeIfPresent(ImageResizeCodable.self, forKey: .resizable)
		self.modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(imageType, forKey: .imageType)
		try container.encodeIfPresent(resize, forKey: .resizable)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
