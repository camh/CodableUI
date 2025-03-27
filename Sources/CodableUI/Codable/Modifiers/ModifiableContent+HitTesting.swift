//
//  ModifiableContent+HitTesting.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func allowsHitTesting(_ enabled: Bool) -> Self {
		addModifier(.allowsHitTesting(enabled))
	}
}
