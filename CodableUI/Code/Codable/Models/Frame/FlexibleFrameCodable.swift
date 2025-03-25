//
//  FlexibleFrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct FlexibleFrameCodable: Codable, Hashable {
	var minWidth: CGFloatCodable?
	var idealWidth: CGFloatCodable?
	var maxWidth: CGFloatCodable?
	
	var minHeight: CGFloatCodable?
	var idealHeight: CGFloatCodable?
	var maxHeight: CGFloatCodable?
	
	var alignment: AlignmentCodable?
	
	init(
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
	
	static func minWidth(_ value: CGFloatCodable) -> Self {
		.init(minWidth: value)
	}
	
	static func idealWidth(_ value: CGFloatCodable) -> Self {
		.init(idealWidth: value)
	}
	
	static func maxWidth(_ value: CGFloatCodable) -> Self {
		.init(maxWidth: value)
	}
	
	static func minHeight(_ value: CGFloatCodable) -> Self {
		.init(minHeight: value)
	}
	
	static func idealHeight(_ value: CGFloatCodable) -> Self {
		.init(idealHeight: value)
	}
	
	static func maxHeight(_ value: CGFloatCodable) -> Self {
		.init(maxHeight: value)
	}
	
	static func alignment(_ value: AlignmentCodable) -> Self {
		.init(alignment: value)
	}
	
	func minWidth(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.minWidth = value
		return copy
	}
	
	func idealWidth(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.idealWidth = value
		return copy
	}
	
	func maxWidth(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.maxWidth = value
		return copy
	}
	
	func minHeight(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.minHeight = value
		return copy
	}
	
	func idealHeight(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.idealHeight = value
		return copy
	}
	
	func maxHeight(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.maxHeight = value
		return copy
	}
	
	 func alignment(_ value: AlignmentCodable) -> Self {
		var copy = self
		copy.alignment = value
		return copy
	}
}
