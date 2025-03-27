//
//  ImageCodableType.swift
//  Breweries
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

extension ImageTypeCodable {
	var image: Image {
		switch self {
		case .name(let name):
			Image(name)
		case .systemName(let systemName):
			Image(systemName: systemName)
		}
	}
}
