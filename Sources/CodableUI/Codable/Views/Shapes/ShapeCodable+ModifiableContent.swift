//
//  ShapeCodable+ModifiableContent.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ShapeCodable {
	public var modifiers: [ViewModifierCodable] {
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
