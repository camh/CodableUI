//
//  RelativeFrameCodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

struct RelativeFrameCodableModifier: ViewModifier {
	let relativeFrame: ContainerRelativeFrameCodable
	
	func body(content: Content) -> some View {
		if let scale = relativeFrame.scale {
			content
				.containerRelativeFrame(
					relativeFrame.axis.axis,
					alignment: relativeFrame.alignment.alignment) { length, _ in
						length * scale.cgFloat
					}
		} else {
			content.containerRelativeFrame(
				relativeFrame.axis.axis,
				alignment: relativeFrame.alignment.alignment
			)
		}
	}
}

#endif
