//
//  NavigationTitleDisplayModeCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

#if canImport(SwiftUI)

import SwiftUI

#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
extension NavigationTitleDisplayModeCodable {
	var titleDisplayMode: NavigationBarItem.TitleDisplayMode {
		switch self {
		case .automatic: .automatic
		case .inline: .inline
		case .large: .large
		}
	}
}
#endif

#endif
