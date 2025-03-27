//
//  AsyncImageCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct AsyncImageCodable: ViewCodable {
	
	enum CodingKeys: String, CodingKey {
		case image
		case scale
		case resize
		case imageModifiers
		case error
		case placeholder
		case modifiers
	}
	
	public var url: URL?
	public var scale: CGFloatCodable?
	public var resize: ImageResizeCodable?
	
	public var imageModifiers: [CodableModifier]?
	public var error: CodableView?
	public var placeholder: CodableView?
	
	public var modifiers: [CodableModifier]
	
	public let id: UUID
	
	public init(
		url: URL? = nil,
		scale: CGFloatCodable? = nil,
		resize: ImageResizeCodable? = nil,
		imageModifiers: [CodableModifier]? = nil
	) {
		self.url = url
		self.scale = scale
		self.resize = resize
		self.imageModifiers = imageModifiers
		self.error = nil
		self.placeholder = nil
		self.modifiers = []
		self.id = UUID()
	}
	
	public init(
		url: URL? = nil,
		scale: CGFloatCodable? = nil,
		resize: ImageResizeCodable? = nil,
		imageModifiers: [CodableModifier]? = nil,
		@CodableViewBuilder error: () -> CodableView,
		@CodableViewBuilder placeholder: () -> CodableView
	) {
		self.url = url
		self.scale = scale
		self.resize = resize
		self.imageModifiers = imageModifiers
		self.error = error()
		self.placeholder = placeholder()
		self.modifiers = []
		self.id = UUID()
	}
}

extension AsyncImageCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		url = try container.decode(URL.self, forKey: .image)
		scale = try container.decodeIfPresent(CGFloatCodable.self, forKey: .scale)
		resize = try container.decodeIfPresent(ImageResizeCodable.self, forKey: .resize)
		imageModifiers = try container.decodeIfPresent([CodableModifier].self, forKey: .imageModifiers)
		error = try container.decodeIfPresent(CodableView.self, forKey: .error)
		placeholder = try container.decodeIfPresent(CodableView.self, forKey: .placeholder)
		modifiers = try container.decode([CodableModifier].self, forKey: .modifiers)
		id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(url, forKey: .image)
		try container.encodeIfPresent(scale, forKey: .scale)
		try container.encodeIfPresent(resize, forKey: .resize)
		try container.encodeIfPresent(imageModifiers, forKey: .imageModifiers)
		try container.encodeIfPresent(error, forKey: .error)
		try container.encodeIfPresent(placeholder, forKey: .placeholder)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
