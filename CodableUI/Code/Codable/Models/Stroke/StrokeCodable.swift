//
//  StrokeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

struct StrokeCodable: Codable, Hashable {
	let color: ColorCodable
	let strokeStyle: StrokeStyleCodable
	let antialiased: Bool
	
	init(
		color: ColorCodable,
		strokeStyle: StrokeStyleCodable = .init(),
		antialiased: Bool = true
	) {
		self.color = color
		self.strokeStyle = strokeStyle
		self.antialiased = antialiased
	}
	
	static func color(
		_ color: ColorCodable,
		lineWidth: CGFloatCodable = 1,
		antialiased: Bool = true
	) -> Self {
		.init(
			color: color,
			strokeStyle: .init(lineWidth: lineWidth),
			antialiased: antialiased
		)
	}
	
	static func color(
		_ color: ColorCodable,
		strokeStyle: StrokeStyleCodable = .init(),
		antialiased: Bool = true
	) -> Self {
		.init(
			color: color,
			strokeStyle: strokeStyle,
			antialiased: antialiased
		)
	}
}
