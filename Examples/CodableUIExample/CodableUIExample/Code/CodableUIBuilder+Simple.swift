//
//  CodableUIBuilder+Simple.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI
import CodableUI

extension CodableUIBuilder {
	@CodableViewBuilder
	var simpleView: CodableView {
		HStackCodable(spacing: 30) {
			ImageCodable(systemName: "globe")
				.resizable()
				.frame(width: 40, height: 40)
				.foregroundStyle(.green)
			TextCodable("Hello, world!")
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(.body)
				.font(.system(size: 20, weight: .bold))
				.foregroundStyle(light: .black, dark: .white)
				.padding(10)
				.background(light: .white(0.8), dark: .white(0.2))
		}
		.padding(20)
		.background(light: .white(0.9), dark: .white(0.1))
	}
}

#Preview {
	CodableKindView(kind: .simple)
}
