//
//  SystemColor+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension SystemColor {
	var color: Color {
		switch self {
		case .black: .black
		case .blue: .blue
		case .brown: .brown
		case .clear: .clear
		case .cyan: .cyan
		case .gray: .gray
		case .green: .green
		case .indigo: .indigo
		case .mint: .mint
		case .orange: .orange
		case .pink: .pink
		case .purple: .purple
		case .red: .red
		case .teal: .teal
		case .white: .white
		case .yellow: .yellow
		}
	}
}

#endif
