//
//  Color+Scheme.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension Color {
	init(light: Color, dark: Color) {
		self.init(
			UIColor.dynamicColor(
				light: UIColor(light),
				dark: UIColor(dark)
			)
		)
	}
}
