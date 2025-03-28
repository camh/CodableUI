//
//  CGLineCapCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension CGLineCapCodable {
	var lineCap: CGLineCap {
		switch self {
		case .butt: .butt
		case .round: .round
		case .square: .square
		}
	}
}

#endif
