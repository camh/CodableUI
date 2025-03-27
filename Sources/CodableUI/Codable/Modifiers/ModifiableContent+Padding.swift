//
//  ModifiableContent+Padding.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func padding(_ padding: EdgeInsetsCodable) -> Self {
		addModifier(.padding(padding))
	}
	public func padding(_ edge: EdgeCodable, _ length: CGFloatCodable) -> Self {
		switch edge {
		case .all:
			addModifier(.padding(.all(length)))
		case .vertical:
			addModifier(.padding(.vertical(length)))
		case .horizontal:
			addModifier(.padding(.horizontal(length)))
		case .top:
			addModifier(.padding(.top(length)))
		case .bottom:
			addModifier(.padding(.bottom(length)))
		case .leading:
			addModifier(.padding(.leading(length)))
		case .trailing:
			addModifier(.padding(.trailing(length)))
		}
	}
	public func padding(_ length: CGFloatCodable) -> Self {
		addModifier(.padding(.all(length)))
	}
}
