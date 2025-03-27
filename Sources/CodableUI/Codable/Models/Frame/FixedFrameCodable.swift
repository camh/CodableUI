//
//  FixedFrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FixedFrameCodable: Codable, Hashable, Sendable {
	
	var width: CGFloatCodable?
	var height: CGFloatCodable?
	
	var alignment: AlignmentCodable?
	
	public init(width: CGFloatCodable? = nil, height: CGFloatCodable? = nil, alignment: AlignmentCodable? = nil) {
		self.width = width
		self.height = height
		self.alignment = alignment
	}
}
