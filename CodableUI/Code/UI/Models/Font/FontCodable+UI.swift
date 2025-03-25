//
//  FontCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension FontCodable {
	var font: Font {
		switch self {
		case .system(let system):
			Font.system(
				system.style.style,
				design: system.design?.design,
				weight: system.weight?.weight
			)
		case .systemFixed(let systemFixed):
			Font.system(
				size: systemFixed.size.rawValue,
				weight: systemFixed.weight?.weight,
				design: systemFixed.design?.design
			)
		case .custom(let custom):
			if let style = custom.relativeTo?.style {
				Font.custom(
					custom.name,
					size: custom.size.rawValue,
					relativeTo: style
				)
			} else {
				Font.custom(
					custom.name,
					size: custom.size.rawValue
				)
			}
		case .customFixed(let customFixed):
			Font.custom(
				customFixed.name,
				fixedSize: customFixed.fixedSize.rawValue
			)
		}
	}
}
