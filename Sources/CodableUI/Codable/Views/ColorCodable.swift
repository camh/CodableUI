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
		case opacity
		case modifiers
	}
	
	public var colorType: ColorCodableType
	public var opacity: DoubleCodable
	public var modifiers: [ViewModifierCodable]
	public let id: UUID
	
	public init(_ colorType: ColorCodableType, opacity: DoubleCodable? = nil) {
		self.colorType = colorType
		self.opacity = opacity ?? 1
		self.modifiers = []
		self.id = UUID()
	}
}

extension ColorCodable {
	public init(white: DoubleCodable, opacity: DoubleCodable? = nil) {
		self = .init(
			.white(ColorWhiteCodable(white: white)),
			opacity: opacity
		)
	}
	
	public init(hex: String) {
		self = .init(.hex(hex))
	}
	
	public init(
		hue: DoubleCodable,
		saturation: DoubleCodable,
		brightness: DoubleCodable,
		opacity: DoubleCodable? = nil
	) {
		let hsb = ColorHSBCodable(
			hue: hue,
			saturation: saturation,
			brightness: brightness
		)
		self = .init(.hsb(hsb), opacity: opacity)
	}
	
	public init(
		red: DoubleCodable,
		green: DoubleCodable,
		blue: DoubleCodable,
		opacity: DoubleCodable? = nil
	) {
		let rgb = ColorRBGCodable(
			red: red,
			 green: green,
			 blue: blue
		 )
		self = .init(.rgb(rgb), opacity: opacity)
	}
	
	public init(light: ColorCodable, dark: ColorCodable) {
		self = .init(.dynamic(light: light.colorType, dark: dark.colorType))
	}
	
	public init(_ system: ColorSystemCodable) {
		self = .init(.system(system))
	}
	
	public static func hex(_ hex: String) -> Self {
		.init(hex: hex)
	}
	
	public static func white(_ white: DoubleCodable, opacity: DoubleCodable? = nil) -> Self {
		.init(white: white, opacity: opacity)
	}
	
	public func opacity(_ opacity: DoubleCodable) -> Self {
		var copy = self
		copy.opacity = opacity
		return copy
	}
}

extension ColorCodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.colorType = try container.decode(ColorCodableType.self, forKey: .colorType)
		self.opacity = try container.decode(DoubleCodable.self, forKey: .opacity)
		self.modifiers = try container.decode([ViewModifierCodable].self, forKey: .modifiers)
		self.id = UUID()
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(colorType, forKey: .colorType)
		try container.encode(opacity, forKey: .opacity)
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
