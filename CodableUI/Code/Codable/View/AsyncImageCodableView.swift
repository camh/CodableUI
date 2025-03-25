//
//  AsyncImageCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct AsyncImageCodableView: Codable, Hashable, Identifiable {
	
	enum CodingKeys: String, CodingKey {
		case image
		case scale
		case resize
		case imageModifiers
		case errorView
		case placeholderView
	}
	
	var url: URL?
	var scale: CGFloatCodable?
	var resize: ImageResizeCodable?
	
	var imageModifiers: [CodableModifier]?
	var errorView: CodableView?
	var placeholderView: CodableView?
	
	let id: UUID
	
	init(
		url: URL? = nil,
		scale: CGFloatCodable? = nil,
		resize: ImageResizeCodable? = nil,
		imageModifiers: [CodableModifier]? = nil,
		errorView: CodableView? = nil,
		placeholderView: CodableView? = nil
	) {
		self.url = url
		self.scale = scale
		self.resize = resize
		self.imageModifiers = imageModifiers
		self.errorView = errorView
		self.placeholderView = placeholderView
		self.id = UUID()
	}
	
	static func url(
		_ url: URL?,
		scale: CGFloatCodable? = nil,
		resize: ImageResizeCodable? = nil,
		imageModifiers: [CodableModifier]? = nil,
		errorView: CodableView? = nil,
		placeholderView: CodableView? = nil
	) -> Self {
		.init(
			url: url,
			scale: scale,
			resize: resize,
			imageModifiers: imageModifiers,
			errorView: errorView,
			placeholderView: placeholderView
		)
	}
	
	func resizable(capInsets: EdgeInsetsCodable? = nil, resizingMode: ImageResizingModeCodable? = nil) -> Self {
		var copy = self
		copy.resize = .init(capInsets: capInsets, resizingMode: resizingMode)
		return copy
	}
}

extension AsyncImageCodableView {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		url = try container.decode(URL.self, forKey: .image)
		scale = try container.decodeIfPresent(CGFloatCodable.self, forKey: .scale)
		resize = try container.decodeIfPresent(ImageResizeCodable.self, forKey: .resize)
		imageModifiers = try container.decodeIfPresent([CodableModifier].self, forKey: .imageModifiers)
		errorView = try container.decodeIfPresent(CodableView.self, forKey: .errorView)
		placeholderView = try container.decodeIfPresent(CodableView.self, forKey: .placeholderView)
		id = UUID()
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(url, forKey: .image)
		try container.encodeIfPresent(scale, forKey: .scale)
		try container.encodeIfPresent(resize, forKey: .resize)
		try container.encodeIfPresent(imageModifiers, forKey: .imageModifiers)
		try container.encodeIfPresent(errorView, forKey: .errorView)
		try container.encodeIfPresent(placeholderView, forKey: .placeholderView)
	}
}
