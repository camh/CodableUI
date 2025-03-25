//
//  ColorCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

indirect enum ColorCodable: Codable, Hashable {
	case white(ColorWhite)
	case system(SystemColor)
	case hex(String)
	case hsba(ColorHSBA)
	case rgba(ColorRBGA)
	case dynamic(light: ColorCodable, dark: ColorCodable)
}
