//
//  ImageResizingModeCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ImageResizingModeCodable {
	var mode: Image.ResizingMode {
		switch self {
		case .stretch: .stretch
		case .tile: .tile
		}
	}
}
