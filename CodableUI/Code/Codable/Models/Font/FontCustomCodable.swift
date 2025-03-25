//
//  FontCustomCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FontCustomCodable: Codable, Hashable {
	let name: String
	let size: CGFloatCodable
	let relativeTo: FontStyleCodable?
}
