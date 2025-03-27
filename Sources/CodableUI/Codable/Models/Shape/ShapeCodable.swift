//
//  ShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public enum ShapeCodable: Codable, Hashable, Sendable {
	case capsule(CapsuleShapeCodable)
	case roundedRectangle(RoundedRectangleShapeCodable)
	case circle
	case rectangle
	case ellipse
	
	public static var capsule: Self {
		return .capsule()
	}
	
	public static func capsule(
		style: RoundedCornerStyleCodable = .continuous
	) -> Self {
		.capsule(.init(style: style))
	}
	
	public static func roundedRectangle(
		cornerSize: CGSize,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil
	) -> Self {
		.roundedRectangle(.init(cornerSize: cornerSize, style: style))
	}
	
	public static func roundedRectangle(
		cornerRadius: CGFloatCodable,
		style: RoundedCornerStyleCodable = .continuous,
		fill: ColorCodable? = nil
	) -> Self {
		.roundedRectangle(.init(cornerRadius: cornerRadius, style: style))
	}
}
