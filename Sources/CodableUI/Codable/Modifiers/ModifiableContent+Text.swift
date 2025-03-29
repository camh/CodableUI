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
	
	public func lineLimit(_ limit: Int) -> Self {
		addModifier(.lineLimit(limit))
	}
	
	public func kerning(_ kerning: CGFloatCodable) -> Self {
		addModifier(.kerning(kerning))
	}
	
	public func tracking(_ tracking: CGFloatCodable) -> Self {
		addModifier(.tracking(tracking))
	}
	
	public func textCase(_ textCase: TextCaseCodable) -> Self {
		addModifier(.textCase(textCase))
	}
}
