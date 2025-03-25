//
//  ShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

enum ShapeCodable: Codable, Hashable {
	case capsule(CapsuleShapeCodable)
	case roundedRectangle(RoundedRectangleShapeCodable)
	case circle
	case rectangle
	case ellipse
	
	static func capsule(
		style: RoundedCornerStyleCodable = .continuous
	) -> Self {
		return .capsule(.init(style: style))
	}
	
	static func roundedRectangle(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil
	) -> Self {
		return .roundedRectangle(.init(cornerSize: cornerSize, style: style))
	}
	
	static func roundedRectangle(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil
	) -> Self {
		return .roundedRectangle(.init(cornerRadius: cornerRadius, style: style))
	}
}
