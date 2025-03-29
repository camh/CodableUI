//
//  ModifiableContent+Blur.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func blur(radius: CGFloatCodable) -> Self {
		addModifier(.blur(radius))
	}
}
