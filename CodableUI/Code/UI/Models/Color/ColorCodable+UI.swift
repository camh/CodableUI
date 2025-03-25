//
//  ColorCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ColorCodable {
	var color: Color {
		switch self {
		case .white(let colorWhite):
			colorWhite.color
		case .system(let systemColor):
			systemColor.color
		case .hex(let hex):
			Color(hex: hex)
		case .hsba(let hsba):
			hsba.color
		case .rgba(let rgba):
			rgba.color
		case .dynamic(let light, let dark):
			Color(light: light.color, dark: dark.color)
		}
	}
}
