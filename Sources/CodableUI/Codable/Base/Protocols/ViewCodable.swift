//
//  ViewCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

import Foundation

protocol ViewCodable: Codable, Hashable, Identifiable, ModifiableContent, Sendable {
	var id: UUID { get }
}
