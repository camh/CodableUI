//
//  FrameCodableModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

struct FrameCodableModifier: ViewModifier {
	let frame: FrameCodable
	
	func body(content: Content) -> some View {
		switch frame {
		case .fixed(let fixedFrame):
			content
				.frame(
					width: fixedFrame.width?.cgFloat,
					height: fixedFrame.height?.cgFloat,
					alignment: fixedFrame.alignment?.alignment ?? .center
				)
		case .flexible(let flexibleFrame):
			content
				.frame(
					minWidth: flexibleFrame.minWidth?.cgFloat,
					idealWidth: flexibleFrame.idealWidth?.cgFloat,
					maxWidth: flexibleFrame.maxWidth?.cgFloat,
					minHeight: flexibleFrame.minHeight?.cgFloat,
					idealHeight: flexibleFrame.idealHeight?.cgFloat,
					maxHeight: flexibleFrame.maxHeight?.cgFloat,
					alignment: flexibleFrame.alignment?.alignment ?? .center
				)
		}
	}
}

#endif
