//
//  ColorHSBCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorHSBCodable {
	var color: Color {
		Color(
			hue: hue.rawValue,
			saturation: saturation.rawValue,
			brightness: brightness.rawValue
		)
	}
}

#endif
