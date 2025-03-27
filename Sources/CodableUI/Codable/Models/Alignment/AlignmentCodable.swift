//
//  AlignmentCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public enum AlignmentCodable: String, Codable, Hashable, Sendable {
	case topLeading
	case top
	case topTrailing
	
	case leading
	case center
	case trailing
	
	case bottomLeading
	case bottom
	case bottomTrailing

	case leadingFirstTextBaseline
	case centerFirstTextBaseline
	case trailingFirstTextBaseline
	
	case leadingLastTextBaseline
	case centerLastTextBaseline
	case trailingLastTextBaseline
}
