//
//  ColorRBGA+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ColorRBGA {
	var color: Color {
		Color(
			red: red.rawValue,
			green: green.rawValue,
			blue: blue.rawValue,
			opacity: opacity?.rawValue ?? 1.0
		)
	}
}
