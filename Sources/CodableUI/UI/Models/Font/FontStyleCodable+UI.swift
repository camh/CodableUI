//
//  FontStyleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension FontStyleCodable {
	var style: Font.TextStyle {
		switch self {
		case .largeTitle: .largeTitle
		case .title: .title
		case .title2: .title2
		case .title3: .title3
		case .headline: .headline
		case .subheadline: .subheadline
		case .body: .body
		case .callout: .callout
		case .caption: .caption
		case .caption2: .caption2
		case .footnote: .footnote
		}
	}
}

#endif
