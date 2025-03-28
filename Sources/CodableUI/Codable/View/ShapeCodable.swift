//
//  ShapeCodableType.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public enum ShapeCodable: CodableShape {
	
	case rectangle(RectangleCodable)
	case circle(CircleCodable)
	case ellipse(EllipseCodable)
	case capsule(CapsuleCodable)
	case roundedRectangle(RoundedRectangleCodable)
	
	public var id: UUID {
		wrapped.id
	}
	
	var wrapped: any CodableShape {
		switch self {
		case .rectangle(let rectangle): rectangle
		case .circle(let circle): circle
		case .ellipse(let ellipse): ellipse
		case .capsule(let capsule): capsule
		case .roundedRectangle(let roundedRectangle): roundedRectangle
		}
	}
}

extension ShapeCodable {
	public var fill: ColorCodable? {
		get { wrapped.fill }
		set {
			switch self {
			case .rectangle(let shape):
				var shape = shape
				shape.fill = newValue
				self = .rectangle(shape)
			case .circle(let shape):
				var shape = shape
				shape.fill = newValue
				self = .circle(shape)
			case .ellipse(let shape):
				var shape = shape
				shape.fill = newValue
				self = .ellipse(shape)
			case .capsule(let shape):
				var shape = shape
				shape.fill = newValue
				self = .capsule(shape)
			case .roundedRectangle(let shape):
				var shape = shape
				shape.fill = newValue
				self = .roundedRectangle(shape)
			}
		}
	}
}

extension ShapeCodable {
	public var stroke: StrokeCodable? {
		get { wrapped.stroke }
		set {
			switch self {
			case .rectangle(let shape):
				var shape = shape
				shape.stroke = newValue
				self = .rectangle(shape)
			case .circle(let shape):
				var shape = shape
				shape.stroke = newValue
				self = .circle(shape)
			case .ellipse(let shape):
				var shape = shape
				shape.stroke = newValue
				self = .ellipse(shape)
			case .capsule(let shape):
				var shape = shape
				shape.stroke = newValue
				self = .capsule(shape)
			case .roundedRectangle(let shape):
				var shape = shape
				shape.stroke = newValue
				self = .roundedRectangle(shape)
			}
		}
	}
}

extension ShapeCodable {
	public var modifiers: [CodableModifier] {
		get { wrapped.modifiers }
		set {
			switch self {
			case .rectangle(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .rectangle(shape)
			case .circle(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .circle(shape)
			case .ellipse(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .ellipse(shape)
			case .capsule(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .capsule(shape)
			case .roundedRectangle(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .roundedRectangle(shape)
			}
		}
	}
}
