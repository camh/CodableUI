//
//  CGLineJoinCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension CGLineJoinCodable {
	var lineJoin: CGLineJoin {
		switch self {
		case .miter: .miter
		case .round: .round
		case .bevel: .bevel
		}
	}
}

#endif
