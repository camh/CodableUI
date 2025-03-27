//
//  ModifiableContent+Navigation.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func navigationTitle(_ title: String) -> Self {
		addModifier(.navigationTitle(title))
	}
}

extension ModifiableContent {
	public func navigationBarTitleDisplayMode(_ mode: NavigationTitleDisplayModeCodable) -> Self {
		addModifier(.navigationBarTitleDisplayMode(mode))
	}
}
