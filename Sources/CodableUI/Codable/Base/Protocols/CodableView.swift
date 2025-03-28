//
//  CodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

import Foundation

public protocol CodableView: Codable, Hashable, Identifiable, ModifiableContent, Sendable {
	var id: UUID { get }
}
