//
//  FontDesignCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension FontDesignCodable {
	var design: Font.Design {
		switch self {
		case .default: .default
		case .monospaced: .monospaced
		case .rounded: .rounded
		case .serif: .serif
		}
	}
}
