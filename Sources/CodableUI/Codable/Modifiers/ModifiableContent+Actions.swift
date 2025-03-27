//
//  ModifiableContent+Actions.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func onTapGesture(_ action: () -> ActionCodable?) -> Self {
		addModifier(.onTapGesture(action()))
	}
}

extension ModifiableContent {
	public func refreshable(_ action: () -> ActionCodable?) -> Self {
		addModifier(.refreshable(action()))
	}
}
