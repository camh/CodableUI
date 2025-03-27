//
//  ModifiableContent+Text.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func multilineTextAlignment(_ alignment: TextAlignmentCodable) -> Self {
		addModifier(.multilineTextAlignment(alignment))
	}
}

extension ModifiableContent {
	public func lineLimit(_ limit: Int) -> Self {
		addModifier(.lineLimit(limit))
	}
}
