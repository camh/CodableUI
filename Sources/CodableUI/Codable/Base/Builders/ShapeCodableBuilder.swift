//
//  ShapeCodableBuilder.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

@resultBuilder
public struct ShapeCodableBuilder {
	
	public static func buildEither(first component: ShapeCodable) -> ShapeCodable {
		component
	}
	
	public static func buildEither(second component: ShapeCodable) -> ShapeCodable {
		component
	}
	
	public static func buildExpression(_ expression: ShapeCodable) -> ShapeCodable {
		expression
	}
	
	public static func buildBlock(_ components: ShapeCodable) -> ShapeCodable {
		components
	}
	
	public static func buildExpression(_ shape: CircleCodable) -> ShapeCodable {
		.circle(shape)
	}
	
	public static func buildExpression(_ shape: RectangleCodable) -> ShapeCodable {
		.rectangle(shape)
	}
	
	public static func buildExpression(_ shape: EllipseCodable) -> ShapeCodable {
		.ellipse(shape)
	}
	
	public static func buildExpression(_ shape: CapsuleCodable) -> ShapeCodable {
		.capsule(shape)
	}
	
	public static func buildExpression(_ shape: RoundedRectangleCodable) -> ShapeCodable {
		.roundedRectangle(shape)
	}
}
