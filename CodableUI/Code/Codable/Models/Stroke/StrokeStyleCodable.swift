//
//  StrokeStyleCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

struct StrokeStyleCodable: Codable, Hashable {
	let lineWidth: CGFloatCodable
	let lineCap: CGLineCapCodable
	let lineJoin: CGLineJoinCodable
	let miterLimit: CGFloatCodable
	let dash: [CGFloatCodable]
	let dashPhase: CGFloatCodable
	
	init(
		lineWidth: CGFloatCodable = 1,
		lineCap: CGLineCapCodable = .butt,
		lineJoin: CGLineJoinCodable = .miter,
		miterLimit: CGFloatCodable = 10,
		dash: [CGFloatCodable] = [],
		dashPhase: CGFloatCodable = 0
	) {
		self.lineWidth = lineWidth
		self.lineCap = lineCap
		self.lineJoin = lineJoin
		self.miterLimit = miterLimit
		self.dash = dash
		self.dashPhase = dashPhase
	}
	
	static func lineWidth(
		_ lineWidth: CGFloatCodable = 1,
		lineCap: CGLineCapCodable = .butt,
		lineJoin: CGLineJoinCodable = .miter,
		miterLimit: CGFloatCodable = 10,
		dash: [CGFloatCodable] = [],
		dashPhase: CGFloatCodable = 0
	) -> Self {
		.init(
			lineWidth: lineWidth,
			lineCap: lineCap,
			lineJoin: lineJoin,
			miterLimit: miterLimit,
			dash: dash,
			dashPhase: dashPhase
		)
	}
}
