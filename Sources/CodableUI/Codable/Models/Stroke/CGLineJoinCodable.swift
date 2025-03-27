//
//  CGLineJoinCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import Foundation

public enum CGLineJoinCodable: Codable, Hashable, Sendable {
	case miter
	case round
	case bevel
}
