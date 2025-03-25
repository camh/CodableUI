//
//  RoundedRectangleShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct RoundedRectangleShapeCodable: Codable, Hashable {
	
	var cornerSize: CGSize
	var style: RoundedCornerStyleCodable
	
	init(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = cornerSize
		self.style = style
	}
	
	init(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = CGSize(
			width: cornerRadius.rawValue,
			height: cornerRadius.rawValue
		)
		self.style = style
	}
	
	static func cornerSize(
		_ size: CGSize,
		style: RoundedCornerStyleCodable = .continuous
	) -> RoundedRectangleShapeCodable {
		Self.init(cornerSize: size, style: style)
	}
	
	static func cornerRadius(
		_ radius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous
	) -> RoundedRectangleShapeCodable {
		Self.init(cornerRadius: radius, style: style)
	}
}
