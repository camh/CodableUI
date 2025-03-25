//
//  CodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

enum CodableModifier: Codable, Hashable {
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
	
	case blur(CGFloatCodable)
	case opacity(DoubleCodable)
	
	case padding(EdgeInsetsCodable)
	case frame(FrameCodable)
}
