//
//  EdgeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

public enum EdgeCodable: String, Codable, Hashable, Sendable {
	case all, vertical, horizontal
	case top, bottom, leading, trailing
}
