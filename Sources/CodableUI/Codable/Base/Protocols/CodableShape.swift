//
//  CodableShape.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

protocol CodableShape: ViewCodable {
	var fill: ColorCodable? { get set }
	var stroke: StrokeCodable? { get set }
}

extension CodableShape {
	func fill(_ color: ColorCodable) -> Self {
		var copy = self
		copy.fill = color
		return copy
	}
	
	func stroke(_ color: ColorCodable) -> Self {
		let stroke = StrokeCodable(color: color, strokeStyle: .init())
		return self.stroke(stroke)
	}
	
	func stroke(_ color: ColorCodable, lineWidth: CGFloatCodable) -> Self {
		let stroke = StrokeCodable(color: color, strokeStyle: .init(lineWidth: lineWidth))
		return self.stroke(stroke)
	}
	
	func stroke(_ stroke: StrokeCodable) -> Self {
		var copy = self
		copy.stroke = stroke
		return copy
	}
}
