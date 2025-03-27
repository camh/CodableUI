//
//  RoundedRectangleShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct RoundedRectangleShapeCodable: Codable, Hashable, Sendable {
	
	var cornerSize: CGSize
	var style: RoundedCornerStyleCodable
	
	public init(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = cornerSize
		self.style = style
	}
	
	public init(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous
	) {
		self.cornerSize = CGSize(
			width: cornerRadius.rawValue,
			height: cornerRadius.rawValue
		)
		self.style = style
	}
	
	public static func cornerSize(
		_ size: CGSize,
		style: RoundedCornerStyleCodable = .continuous
	) -> RoundedRectangleShapeCodable {
		Self.init(cornerSize: size, style: style)
	}
	
	public static func cornerRadius(
		_ radius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous
	) -> RoundedRectangleShapeCodable {
		Self.init(cornerRadius: radius, style: style)
	}
}
