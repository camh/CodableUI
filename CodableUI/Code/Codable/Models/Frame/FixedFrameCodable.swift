//
//  FixedFrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FixedFrameCodable: Codable, Hashable {
	
	var width: CGFloatCodable?
	var height: CGFloatCodable?
	
	var alignment: AlignmentCodable?
	
	init(width: CGFloatCodable? = nil, height: CGFloatCodable? = nil, alignment: AlignmentCodable? = nil) {
		self.width = width
		self.height = height
		self.alignment = alignment
	}
	
	static func uniform(_ value: CGFloatCodable) -> FixedFrameCodable {
		.init(width: value, height: value)
	}
	
	static func width(_ width: CGFloatCodable) -> FixedFrameCodable {
		.init(width: width)
	}
	
	static func height(_ height: CGFloatCodable) -> FixedFrameCodable {
		.init(height: height)
	}
	
	static func alignment(_ alignment: AlignmentCodable) -> FixedFrameCodable {
		.init(alignment: alignment)
	}
	
	func width(_ width: CGFloatCodable) -> Self {
		var copy = self
		copy.width = width
		return copy
	}
	
	func height(_ height: CGFloatCodable) -> Self {
		var copy = self
		copy.height = height
		return copy
	}
	
	func alignment(_ alignment: AlignmentCodable) -> Self {
		var copy = self
		copy.alignment = alignment
		return copy
	}
}
