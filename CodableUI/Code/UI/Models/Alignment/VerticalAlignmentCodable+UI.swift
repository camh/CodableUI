//
//  VerticalAlignmentCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension VerticalAlignmentCodable {
	var verticalAlignment: VerticalAlignment {
		switch self {
		case .top: .top
		case .center: .center
		case .bottom: .bottom
		case .firstTextBaseline: .firstTextBaseline
		case .lastTextBaseline: .lastTextBaseline
		}
	}
}
