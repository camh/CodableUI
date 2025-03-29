//
//  ColorCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorCodableType {
	var color: Color {
		switch self {
		case .white(let colorWhite):
			colorWhite.color
		case .system(let systemColor):
			systemColor.color
		case .hex(let hex):
			Color(hex: hex)
		case .hsb(let hsb):
			hsb.color
		case .rgb(let rgb):
			rgb.color
		case .dynamic(let light, let dark):
			Color(light: light.color, dark: dark.color)
		}
	}
}

#endif
