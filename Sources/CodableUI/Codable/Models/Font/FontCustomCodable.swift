//
//  FontCustomCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FontCustomCodable: Codable, Hashable, Sendable {
	let name: String
	let size: CGFloatCodable
	let relativeTo: FontStyleCodable?
}
