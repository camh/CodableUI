//
//  StrokeStyleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI

extension StrokeStyleCodable {
	var strokeStyle: StrokeStyle {
		StrokeStyle(
			lineWidth: lineWidth.rawValue,
			lineCap: lineCap.lineCap,
			lineJoin: lineJoin.lineJoin,
			miterLimit: miterLimit.rawValue,
			dash: dash.map { $0.rawValue },
			dashPhase: dashPhase.rawValue
		)
	}
}
