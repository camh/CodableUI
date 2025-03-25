//
//  FontCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

enum FontCodable: Codable, Hashable {
	case system(FontSystemCodable)
	case systemFixed(FontSystemFixedCodable)
	case custom(FontCustomCodable)
	case customFixed(FontCustomFixedCodable)
}
