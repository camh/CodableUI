//
//  EnvironmentValues+CodableAction.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

public struct CodableActionKey: EnvironmentKey {
	public static let defaultValue: @Sendable (ActionCodable) async -> () = { _ in }
}

extension EnvironmentValues {
	public var codableActionHandler: @Sendable (ActionCodable) async -> () {
		get { self[CodableActionKey.self] }
		set { self[CodableActionKey.self] = newValue }
	}
}
