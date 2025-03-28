//
//  ViewModifierCodableApplier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension View {
	func codableApply(
		_ modifiers: [ViewModifierCodable]
	) -> some View {
		modifier(
			ViewModifierCodableApplier(modifiers: modifiers)
		)
	}
}

struct ViewModifierCodableApplier: ViewModifier {
	let modifiers: [ViewModifierCodable]
	
	func body(content: Content) -> some View {
		content
			.if(!modifiers.isEmpty) { view in
				view
					.modifier(
						RecursiveViewModifierApplier(
							modifier: modifiers.first!,
							next: Array(modifiers.dropFirst())
						)
					)
			}
	}
}

struct RecursiveViewModifierApplier: ViewModifier {
	let modifier: ViewModifierCodable
	let next: [ViewModifierCodable]
	
	func body(content: Content) -> some View {
		content
			.modifier(modifier)
			.if(!next.isEmpty) { view in
				view
					.modifier(
						Self(
							modifier: next.first!,
							next: Array(next.dropFirst())
						)
					)
			}
	}
}
