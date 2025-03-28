//
//  ShapeCodable+CodableShape.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

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
