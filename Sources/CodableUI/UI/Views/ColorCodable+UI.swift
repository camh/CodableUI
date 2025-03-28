//
//  ColorCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ColorCodable: View {
	public var color: Color {
		colorType.color
	}
	public var body: some View {
		color
	}
}

#endif
