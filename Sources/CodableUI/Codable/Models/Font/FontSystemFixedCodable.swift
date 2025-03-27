//
//  FontSystemFixedCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FontSystemFixedCodable: Codable, Hashable, Sendable {
	let size: CGFloatCodable
	let weight: FontWeightCodable?
	let design: FontDesignCodable?
}
