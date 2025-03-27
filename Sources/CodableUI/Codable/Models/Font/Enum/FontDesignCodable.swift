//
//  FontDesignCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public enum FontDesignCodable: String, Codable, Hashable, Sendable {
	case `default`
	case monospaced
	case rounded
	case serif
}
