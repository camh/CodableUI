//
//  ColorCodableType.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public indirect enum ColorCodableType: Codable, Hashable, Sendable {
	case white(ColorWhiteCodable)
	case system(ColorSystemCodable)
	case hex(String)
	case hsb(ColorHSBCodable)
	case rgb(ColorRBGCodable)
	case dynamic(light: ColorCodableType, dark: ColorCodableType)
}
