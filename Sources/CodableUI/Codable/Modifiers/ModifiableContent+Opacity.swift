//
//  ModifiableContent+Opacity.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func opacity(_ opacity: DoubleCodable) -> Self {
		addModifier(.opacity(opacity))
	}
}
