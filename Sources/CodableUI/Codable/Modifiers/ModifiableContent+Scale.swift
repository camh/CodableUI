//
//  ModifiableContent+Scale.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func scaledToFill() -> Self {
		addModifier(.scaledToFill)
	}
}

extension ModifiableContent {
	public func scaledToFit() -> Self {
		addModifier(.scaledToFit)
	}
}
