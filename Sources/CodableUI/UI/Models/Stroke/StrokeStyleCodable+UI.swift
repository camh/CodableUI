//
//  StrokeStyleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension StrokeStyleCodable {
	var strokeStyle: StrokeStyle {
		StrokeStyle(
			lineWidth: lineWidth.cgFloat,
			lineCap: lineCap.lineCap,
			lineJoin: lineJoin.lineJoin,
			miterLimit: miterLimit.cgFloat,
			dash: dash.map { $0.cgFloat },
			dashPhase: dashPhase.cgFloat
		)
	}
}

#endif
