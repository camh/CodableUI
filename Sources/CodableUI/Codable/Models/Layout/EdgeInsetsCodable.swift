//
//  EdgeInsetsCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct EdgeInsetsCodable: Codable, Hashable, Sendable {
	
	var top: CGFloatCodable?
	var leading: CGFloatCodable?
	var bottom: CGFloatCodable?
	var trailing: CGFloatCodable?
	
	public static func all(_ all: CGFloatCodable) -> Self {
		.init(all)
	}
	
	public static func vertical(_ vertical: CGFloatCodable) -> Self {
		.init(top: vertical, bottom: vertical)
	}
	
	public static func horizontal(_ horizontal: CGFloatCodable) -> Self {
		.init(leading: horizontal, trailing: horizontal)
	}
	
	public static func top(_ top: CGFloatCodable) -> Self {
		.init(top: top)
	}
	
	public static func leading(_ leading: CGFloatCodable) -> Self {
		.init(leading: leading)
	}
	
	public static func bottom(_ bottom: CGFloatCodable) -> Self {
		.init(bottom: bottom)
	}
	
	public static func trailing(_ trailing: CGFloatCodable) -> Self {
		.init(trailing: trailing)
	}
	
	public init(_ length: CGFloatCodable) {
		self.top = length
		self.leading = length
		self.bottom = length
		self.trailing = length
	}
	
	public init(
		top: CGFloatCodable? = nil,
		leading: CGFloatCodable? = nil,
		bottom: CGFloatCodable? = nil,
		trailing: CGFloatCodable? = nil
	) {
		self.top = top
		self.leading = leading
		self.bottom = bottom
		self.trailing = trailing
	}
	
	public func horizontal(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.leading = value
		copy.trailing = value
		return copy
	}
	
	public func vertical(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.top = value
		copy.bottom = value
		return copy
	}
}
