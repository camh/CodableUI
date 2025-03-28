//
//  FontCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension FontCodable {
	var font: Font {
		switch self {
		case .systemStyle(let system):
			Font.system(
				system.style.style,
				design: system.design?.design,
				weight: system.weight?.weight
			)
		case .systemFixed(let systemFixed):
			Font.system(
				size: systemFixed.size.cgFloat,
				weight: systemFixed.weight?.weight,
				design: systemFixed.design?.design
			)
		case .customStyle(let custom):
			if let style = custom.relativeTo?.style {
				Font.custom(
					custom.name,
					size: custom.size.cgFloat,
					relativeTo: style
				)
			} else {
				Font.custom(
					custom.name,
					size: custom.size.cgFloat
				)
			}
		case .customFixed(let customFixed):
			Font.custom(
				customFixed.name,
				fixedSize: customFixed.fixedSize.cgFloat
			)
		}
	}
}

#endif
