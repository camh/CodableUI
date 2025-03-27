//
//  CodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public enum CodableModifier: Codable, Hashable, Sendable {
	case foregroundColor(ColorCodable)
	case backgroundColor(ColorCodable)
	case backgroundView(CodableView)

	case font(FontCodable)
	case multilineTextAlignment(TextAlignmentCodable)
	case lineLimit(Int?)
	
	case scaledToFill
	case scaledToFit
	case clipped
	case clipShape(ShapeCodable)
	case allowsHitTesting(Bool)
	case ignoresSafeArea(IgnoresSafeAreaCodable)
	
	case blur(CGFloatCodable)
	case opacity(DoubleCodable)
	
	case padding(EdgeInsetsCodable)
	case frame(FrameCodable)
	case layoutPriority(DoubleCodable)
	
	case navigationTitle(String)
	case navigationBarTitleDisplayMode(NavigationTitleDisplayModeCodable)
	case toolbar(ToolbarItemCodable)
	
	case onTapGesture(ActionCodable?)
	case refreshable(ActionCodable?)
}
