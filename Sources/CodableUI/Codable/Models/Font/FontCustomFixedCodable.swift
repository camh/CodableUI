//
//  FontCustomFixedCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FontCustomFixedCodable: Codable, Hashable, Sendable {
	let name: String
	let fixedSize: CGFloatCodable
}
