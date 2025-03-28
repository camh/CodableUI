//
//  AlignmentCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension AlignmentCodable {
	var alignment: Alignment {
		switch self {
		case .topLeading: .topLeading
		case .top: .top
		case .topTrailing: .topTrailing
			
		case .leading: .leading
		case .center: .center
		case .trailing: .trailing
		
		case .bottomLeading: .bottomLeading
		case .bottom: .bottom
		case .bottomTrailing: .bottomTrailing
			
		case .leadingFirstTextBaseline: .leadingFirstTextBaseline
		case .centerFirstTextBaseline: .centerFirstTextBaseline
		case .trailingFirstTextBaseline: .trailingFirstTextBaseline
			
		case .leadingLastTextBaseline: .leadingLastTextBaseline
		case .centerLastTextBaseline: .centerLastTextBaseline
		case .trailingLastTextBaseline: .trailingLastTextBaseline
		}
	}
}

#endif
