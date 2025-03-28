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
					width: fixedFrame.width?.rawValue,
					height: fixedFrame.height?.rawValue,
					alignment: fixedFrame.alignment?.alignment ?? .center
				)
		case .flexible(let flexibleFrame):
			content
				.frame(
					minWidth: flexibleFrame.minWidth?.rawValue,
					idealWidth: flexibleFrame.idealWidth?.rawValue,
					maxWidth: flexibleFrame.maxWidth?.rawValue,
					minHeight: flexibleFrame.minHeight?.rawValue,
					idealHeight: flexibleFrame.idealHeight?.rawValue,
					maxHeight: flexibleFrame.maxHeight?.rawValue,
					alignment: flexibleFrame.alignment?.alignment ?? .center
				)
		}
	}
}

#endif
