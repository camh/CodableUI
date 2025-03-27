//
//  ColorCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ColorCodable: View {
	public var color: Color {
		colorType.color
	}
	public var body: some View {
		color
	}
}
