//
//  ColorCodableType.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public indirect enum ColorCodableType: Codable, Hashable, Sendable {
	case white(ColorWhite)
	case system(SystemColor)
	case hex(String)
	case hsba(ColorHSBA)
	case rgba(ColorRBGA)
	case dynamic(light: ColorCodableType, dark: ColorCodableType)
}
