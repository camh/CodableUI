//
//  HorizontalAlignmentCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension HorizontalAlignmentCodable {
	var horizontalAlignment: HorizontalAlignment {
		switch self {
		case .leading: .leading
		case .center: .center
		case .trailing: .trailing
		case .listRowSeparatorLeading: .listRowSeparatorLeading
		case .listRowSeparatorTrailing: .listRowSeparatorTrailing
		}
	}
}

#endif
