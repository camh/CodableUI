//
//  TextAlignmentCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension TextAlignmentCodable {
	var textAlignment: TextAlignment {
		switch self {
		case .center: .center
		case .leading: .leading
		case .trailing: .trailing
		}
	}
}
