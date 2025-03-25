//
//  EdgeInsetsCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

struct EdgeInsetsCodable: Codable, Hashable {
	
	var all: CGFloatCodable?
	
	var top: CGFloatCodable?
	var leading: CGFloatCodable?
	var bottom: CGFloatCodable?
	var trailing: CGFloatCodable?
	
	static func all(_ all: CGFloatCodable) -> Self {
		.init(all: all)
	}
	
	static func vertical(_ vertical: CGFloatCodable) -> Self {
		.init(top: vertical, bottom: vertical)
	}
	
	static func horizontal(_ horizontal: CGFloatCodable) -> Self {
		.init(leading: horizontal, trailing: horizontal)
	}
	
	static func top(_ top: CGFloatCodable) -> Self {
		.init(top: top)
	}
	
	static func leading(_ leading: CGFloatCodable) -> Self {
		.init(leading: leading)
	}
	
	static func bottom(_ bottom: CGFloatCodable) -> Self {
		.init(bottom: bottom)
	}
	
	static func trailing(_ trailing: CGFloatCodable) -> Self {
		.init(trailing: trailing)
	}
	
	init(
		all: CGFloatCodable? = nil,
		top: CGFloatCodable? = nil,
		leading: CGFloatCodable? = nil,
		bottom: CGFloatCodable? = nil,
		trailing: CGFloatCodable? = nil
	) {
		self.all = all
		self.top = top
		self.leading = leading
		self.bottom = bottom
		self.trailing = trailing
	}
	
	func horizontal(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.leading = value
		copy.trailing = value
		return copy
	}
	
	func vertical(_ value: CGFloatCodable) -> Self {
		var copy = self
		copy.top = value
		copy.bottom = value
		return copy
	}
}
