//
//  FontCustomFixedCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FontCustomFixedCodable: Codable, Hashable {
	let name: String
	let fixedSize: CGFloatCodable
}
