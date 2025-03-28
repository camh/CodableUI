//
//  ModifiableContent+Toolbar.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func toolbar(_ item: ToolbarItemCodable) -> Self {
		addModifier(.toolbar(item))
	}
	public func toolbar(_ item: () -> ToolbarItemCodable) -> Self {
		addModifier(.toolbar(item()))
	}
}
