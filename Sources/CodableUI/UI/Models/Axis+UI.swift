//
//  Axis+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension AxisCodable {
	var axis: Axis.Set {
		switch self {
		case .horizontal: .horizontal
		case .vertical: .vertical
		}
	}
}

#endif
