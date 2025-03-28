//
//  CGSizeCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

public extension CGSizeCodable {
	var cgSize: CGSize {
		CGSize(width: width.cgFloat, height: height.cgFloat)
	}
}

#endif
