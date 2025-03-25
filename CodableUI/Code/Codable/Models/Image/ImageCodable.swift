//
//  ImageCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

enum ImageCodable: Codable, Hashable {
	case systemName(String)
	case name(String)
}
