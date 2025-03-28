//
//  CGSizeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public struct CGSizeCodable: Codable, Hashable, Sendable {
	let width: CGFloatCodable
	let height: CGFloatCodable
	
	init(width: CGFloatCodable, height: CGFloatCodable) {
		self.width = width
		self.height = height
	}
}
