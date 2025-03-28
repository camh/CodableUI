//
//  ColorCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public struct ColorCodable: CodableView {
	
	enum CodingKeys: String, CodingKey {
		case colorType
		case modifiers
	}
	
	public init(_ colorType: ColorCodableType) {
		self.colorType = colorType
		self.modifiers = []
		self.id = UUID()
	}
	
	public var colorType: ColorCodableType
	public var modifiers: [ViewModifierCodable]
	public let id: UUID
}

extension ColorCodable {
	public init(white: DoubleCodable, opacity: DoubleCodable? = nil) {
		self = .init(.white(ColorWhite(white: white, opacity: opacity)))
	}
	
	public init(hex: String) {
		self = .init(.hex(hex))
	}
	
	public init(
		hue: DoubleCodable,
		saturation: DoubleCodable,
		brightness: DoubleCodable,
		opacity: DoubleCodable = 1.0
	) {
		let hsba = ColorHSBA(
			hue: hue,
			saturation: saturation,
			brightness: brightness,
			opacity: opacity
		)
		self = .init(.hsba(hsba))
	}
	
	public init(
		red: DoubleCodable,
		green: DoubleCodable,
		blue: DoubleCodable,
		opacity: DoubleCodable = 1.0
	) {
		let rgba = ColorRBGA(
			red: red,
			 green: green,
			 blue: blue,
			 opacity: opacity
		 )
		self = .init(.rgba(rgba))
	}
	
	public init(light: ColorCodable, dark: ColorCodable) {
		self = .init(.dynamic(light: light.colorType, dark: dark.colorType))
	}
	
	public init(_ system: SystemColor) {
		self = .init(.system(system))
	}
	
	public static func white(_ white: DoubleCodable, opacity: DoubleCodable? = nil) -> Self {
		return Self.init(white: white, opacity: opacity)
	}
}

extension ColorCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.colorType = try container.decode(ColorCodableType.self, forKey: .colorType)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(colorType, forKey: .colorType)
		try container.encode(modifiers, forKey: .modifiers)
	}
}

extension ColorCodable {
	public static var black: Self {
		Self(.system(.black))
	}
	public static var blue: Self {
		Self(.system(.blue))
	}
	public static var brown: Self {
		Self(.system(.brown))
	}
	public static var clear: Self {
		Self(.system(.clear))
	}
	public static var cyan: Self {
		Self(.system(.cyan))
	}
	public static var gray: Self {
		Self(.system(.gray))
	}
	public static var green: Self {
		Self(.system(.green))
	}
	public static var indigo: Self {
		Self(.system(.indigo))
	}
	public static var mint: Self {
		Self(.system(.mint))
	}
	public static var orange: Self {
		Self(.system(.orange))
	}
	public static var pink: Self {
		Self(.system(.pink))
	}
	public static var purple: Self {
		Self(.system(.purple))
	}
	public static var red: Self {
		Self(.system(.red))
	}
	public static var teal: Self {
		Self(.system(.teal))
	}
	public static var white: Self {
		Self(.system(.white))
	}
	public static var yellow: Self {
		Self(.system(.yellow))
	}
}
