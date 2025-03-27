//
//  ToolbarItemPlacementCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

public enum ToolbarItemPlacementCodable: String, Codable, Hashable, Sendable {
	case automatic
	case principal
	case status
	
	case primaryAction
	case secondaryAction
	case confirmationAction
	case cancellationAction
	case destructiveAction
	case navigation
	
	case topBarLeading
	case topBarTrailing
	case bottomBar
	case keyboard
}
