//
//  ColorHSBA+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorHSBA {
	var color: Color {
		Color(
			hue: hue.rawValue,
			saturation: saturation.rawValue,
			brightness: brightness.rawValue,
			opacity: opacity?.rawValue ?? 1.0
		)
	}
}

#endif
