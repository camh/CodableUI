//
//  ImageTypeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public enum ImageTypeCodable: Codable, Hashable, Sendable {
	case systemName(String)
	case name(String)
}
