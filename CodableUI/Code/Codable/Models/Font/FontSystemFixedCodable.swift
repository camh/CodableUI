//
//  FontSystemFixedCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FontSystemFixedCodable: Codable, Hashable {
	let size: CGFloatCodable
	let weight: FontWeightCodable?
	let design: FontDesignCodable?
}
