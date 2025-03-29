//
//  ColorRBGCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorRBGCodable {
	var color: Color {
		Color(
			red: red.rawValue,
			green: green.rawValue,
			blue: blue.rawValue
		)
	}
}

#endif
