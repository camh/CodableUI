//
//  ColorWhite+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorWhite {
	var color: Color {
		Color(
			white: white.rawValue,
			opacity: opacity?.rawValue ?? 1
		)
	}
}


#endif
