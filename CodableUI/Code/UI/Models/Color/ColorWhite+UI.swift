//
//  ColorWhite+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ColorWhite {
	var color: Color {
		Color(
			white: white.rawValue,
			opacity: opacity?.rawValue ?? 1
		)
	}
}
