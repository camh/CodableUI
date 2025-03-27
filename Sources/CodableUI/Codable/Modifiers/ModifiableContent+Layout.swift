//
//  ModifiableContent+Layout.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func layoutPriority(_ priority: DoubleCodable) -> Self {
		addModifier(.layoutPriority(priority))
	}
}
