//
//  FlexibleFrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct FlexibleFrameCodable: Codable, Hashable, Sendable {
	var minWidth: CGFloatCodable?
	var idealWidth: CGFloatCodable?
	var maxWidth: CGFloatCodable?
	
	var minHeight: CGFloatCodable?
	var idealHeight: CGFloatCodable?
	var maxHeight: CGFloatCodable?
	
	var alignment: AlignmentCodable?
	
	public init(
		minWidth: CGFloatCodable? = nil,
		idealWidth: CGFloatCodable? = nil,
		maxWidth: CGFloatCodable? = nil,
		minHeight: CGFloatCodable? = nil,
		idealHeight: CGFloatCodable? = nil,
		maxHeight: CGFloatCodable? = nil,
		alignment: AlignmentCodable? = nil
	) {
		self.minWidth = minWidth
		self.idealWidth = idealWidth
		self.maxWidth = maxWidth
		self.minHeight = minHeight
		self.idealHeight = idealHeight
		self.maxHeight = maxHeight
		self.alignment = alignment
	}
}
