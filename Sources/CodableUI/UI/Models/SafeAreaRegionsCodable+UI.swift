//
//  SafeAreaRegionsCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

extension SafeAreaRegionsCodable {
	var regions: SafeAreaRegions {
		switch self {
		case .all: .all
		case .container: .container
		case .keyboard: .keyboard
		}
	}
}
