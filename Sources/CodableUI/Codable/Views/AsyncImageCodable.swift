//
//  AsyncImageCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct AsyncImageCodable: CodableView {
	
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
	
	public var imageModifiers: [ViewModifierCodable] = []
	public var error: ViewCodable?
	public var placeholder: ViewCodable?
	
	public var modifiers: [ViewModifierCodable]
	
	public let id: UUID
	
	public init(
		url: URL? = nil,
		scale: CGFloatCodable? = nil,
		imageModifiers: [ViewModifierCodable]? = nil
	) {
		self.url = url
		self.scale = scale
		self.resize = nil
		self.imageModifiers = imageModifiers ?? []
		self.error = nil
		self.placeholder = nil
		self.modifiers = []
		self.id = UUID()
	}
	
	public init(
		url: URL? = nil,
		scale: CGFloatCodable? = nil,
		imageModifiers: [ViewModifierCodable]? = nil,
		@ViewCodableBuilder error: () -> ViewCodable,
		@ViewCodableBuilder placeholder: () -> ViewCodable
	) {
		self.url = url
		self.scale = scale
		self.resize = nil
		self.imageModifiers = imageModifiers ?? []
		self.error = error()
		self.placeholder = placeholder()
		self.modifiers = []
		self.id = UUID()
	}
	
	public func resizable(
		capInsets: EdgeInsetsCodable? = nil,
		resizingMode: ImageResizingModeCodable? = nil
	) -> Self {
		var copy = self
		copy.resize = ImageResizeCodable(
			capInsets: capInsets,
			resizingMode: resizingMode
		)
		return copy
	}
}

extension AsyncImageCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		url = try container.decode(URL.self, forKey: .image)
		scale = try container.decodeIfPresent(CGFloatCodable.self, forKey: .scale)
		resize = try container.decodeIfPresent(ImageResizeCodable.self, forKey: .resize)
		imageModifiers = try container.decode([ViewModifierCodable].self, forKey: .imageModifiers)
		error = try container.decodeIfPresent(ViewCodable.self, forKey: .error)
		placeholder = try container.decodeIfPresent(ViewCodable.self, forKey: .placeholder)
		modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(url, forKey: .image)
		try container.encodeIfPresent(scale, forKey: .scale)
		try container.encodeIfPresent(resize, forKey: .resize)
		try container.encode(imageModifiers, forKey: .imageModifiers)
		try container.encodeIfPresent(error, forKey: .error)
		try container.encodeIfPresent(placeholder, forKey: .placeholder)
		try container.encode(modifiers, forKey: .modifiers)
	}
}
