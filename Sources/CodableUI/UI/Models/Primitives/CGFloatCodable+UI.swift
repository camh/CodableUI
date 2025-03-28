//
//  CGFloatCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension CGFloatCodable {
	var cgFloat: CGFloat {
		CGFloat(self.rawValue)
	}
}

#endif
