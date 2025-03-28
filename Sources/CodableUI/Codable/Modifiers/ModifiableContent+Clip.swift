//
//  ModifiableContent+Clip.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func clipped() -> Self {
		addModifier(.clipped)
	}
}

extension ModifiableContent {
	public func clipShape(
		@ShapeCodableBuilder _ shape: () -> ShapeCodable
	) -> Self {
		addModifier(.clipShape(shape()))
	}
}
