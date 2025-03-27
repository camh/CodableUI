//
//  ColorRBGA.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct ColorRBGA: Codable, Hashable, Sendable {
	public let red: DoubleCodable
	public let green: DoubleCodable
	public let blue: DoubleCodable
	public let opacity: DoubleCodable?
}
