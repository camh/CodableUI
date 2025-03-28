//
//  ViewModifierCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ViewModifierCodable: ViewModifier {
	public func body(content: Content) -> some View {
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
		case .multilineTextAlignment(let alignment):
			content.multilineTextAlignment(alignment.textAlignment)
		case .lineLimit(let limit):
			content.lineLimit(limit)
			
		case .scaledToFit:
			content.scaledToFit()
		case .scaledToFill:
			content.scaledToFill()
		case .clipped:
			content.clipped()
		case .allowsHitTesting(let enabled):
			content.allowsHitTesting(enabled)
		case .ignoresSafeArea(let ignoresSafeArea):
			content.ignoresSafeArea(
				ignoresSafeArea.regions.regions,
				edges: ignoresSafeArea.edges.edges
			)
			
		case .clipShape(let shape):
			content.modifier(ClipShapeCodableModifier(shape: shape))
			
		case .opacity(let opacity):
			content.opacity(opacity.rawValue)
		case .blur(let radius):
			content.blur(radius: radius.rawValue)
			
		case .padding(let insets):
			content.padding(insets.edgeInsets)
		case .frame(let frame):
			content.modifier(FrameCodableModifier(frame: frame))
		case .layoutPriority(let priority):
			content.layoutPriority(priority.rawValue)
			
		case .navigationTitle(let title):
			content.navigationTitle(title)
		case .navigationBarTitleDisplayMode(let displayMode):
			#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
			content.navigationBarTitleDisplayMode(displayMode.titleDisplayMode)
			#else
			content
			#endif
		case .toolbar(let toolbarItem):
			content.toolbar {
				ToolbarItem(placement: toolbarItem.placement.toolbarPlacement) {
					toolbarItem.content
				}
			}
			
		case .onTapGesture(let action):
			content.modifier(OnTapGestureCodableModifier(actionCodable: action))
		case .refreshable(let action):
			content.modifier(RefreshableCodableModifier(actionCodable: action))
		}
	}
}
