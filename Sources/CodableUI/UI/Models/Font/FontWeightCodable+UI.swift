//
//  FontWeightCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension FontWeightCodable {
	var weight: Font.Weight {
		switch self {
		case .black: .black
		case .bold: .bold
		case .heavy: .heavy
		case .light: .light
		case .medium: .medium
		case .regular: .regular
		case .semibold: .semibold
		case .thin: .thin
		case .ultraLight: .ultraLight
		}
	}
}
