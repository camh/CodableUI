//
//  ToolbarItemPlacementCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ToolbarItemPlacementCodable {
	var toolbarPlacement: ToolbarItemPlacement {
		switch self {
		case .automatic: .automatic
		case .principal: .principal
		case .status: .status
		case .primaryAction: .primaryAction
		case .secondaryAction: .secondaryAction
		case .confirmationAction: .confirmationAction
		case .cancellationAction: .cancellationAction
		case .destructiveAction: .destructiveAction
		#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
		case .navigation: .navigation
		case .topBarLeading: .topBarLeading
		case .topBarTrailing: .topBarTrailing
		case .bottomBar: .bottomBar
			#else
		case .navigation, .topBarLeading, .topBarTrailing, .bottomBar:
				.automatic
		#endif
		case .keyboard: .keyboard
		}
	}
}

#endif
