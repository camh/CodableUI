//
//  ClipShapeCodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

struct ClipShapeCodableModifier: ViewModifier {
	let shape: ShapeCodable
	
	func body(content: Content) -> some View {
		switch shape {
		case .capsule(let capsule):
			content.clipShape(
				Capsule(
					style: capsule.style.style
				)
			)
		case .roundedRectangle(let roundedRectangle):
			content.clipShape(
				RoundedRectangle(
					cornerSize: roundedRectangle.cornerSize,
					style: roundedRectangle.style.style
				)
			)
		case .circle:
			content.clipShape(Circle())
		case .rectangle:
			content.clipShape(Rectangle())
		case .ellipse:
			content.clipShape(Ellipse())
		}
	}
}

#endif
