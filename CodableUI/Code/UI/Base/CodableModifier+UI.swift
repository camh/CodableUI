//
//  CodableModifier+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension CodableModifier: ViewModifier {
	func body(content: Content) -> some View {
		switch self {

		case .foregroundColor(let color):
			content.foregroundStyle(color.color)
		case .backgroundColor(let color):
			content.background(color.color)
		case .backgroundView(let view):
			content.background {
				view
			}

		case .font(let font):
			content.font(font.font)
			
		case .scaledToFit:
			content.scaledToFit()
		case .scaledToFill:
			content.scaledToFill()
		case .clipped:
			content.clipped()
			
		case .clipShape(let shape):
			content.modifier(ClipShapeCodableModifier(shape: shape))
			
		case .multilineTextAlignment(let alignment):
			content.multilineTextAlignment(alignment.textAlignment)
			
		case .opacity(let opacity):
			content.opacity(opacity.rawValue)
		case .blur(let radius):
			content.blur(radius: radius.rawValue)
			
		case .padding(let insets):
			content.padding(insets.edgeInsets)
			
		case .frame(let frame):
			content.modifier(FrameCodableModifier(frame: frame))
		}
	}
}
