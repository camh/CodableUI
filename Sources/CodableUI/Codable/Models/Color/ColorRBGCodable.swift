//
//  ColorRBGCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct ColorRBGCodable: Codable, Hashable, Sendable {
	public let red: DoubleCodable
	public let green: DoubleCodable
	public let blue: DoubleCodable
}
