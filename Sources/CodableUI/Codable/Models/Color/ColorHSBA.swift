//
//  ColorHSBA.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct ColorHSBA: Codable, Hashable, Sendable {
	public let hue: DoubleCodable
	public let saturation: DoubleCodable
	public let brightness: DoubleCodable
	public let opacity: DoubleCodable?
}
