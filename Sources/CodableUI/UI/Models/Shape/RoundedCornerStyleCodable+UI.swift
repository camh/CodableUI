//
//  RoundedCornerStyleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension RoundedCornerStyleCodable {
	var style: RoundedCornerStyle {
		switch self {
		case .circular: .circular
		case .continuous: .continuous
		}
	}
}

#endif
