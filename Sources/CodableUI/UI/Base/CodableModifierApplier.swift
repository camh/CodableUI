//
//  CodableModifierApplier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension View {
	func codableApply(_ modifiers: [CodableModifier]) -> some View {
		modifier(CodableModifierModifier(modifiers: modifiers))
	}
}

struct CodableModifierModifier: ViewModifier {
	let modifiers: [CodableModifier]
	
	func body(content: Content) -> some View {
		content
			.if(!modifiers.isEmpty) { view in
				view
					.modifier(
						CodableModifierApplier(
							modifier: modifiers.first!,
							next: Array(modifiers.dropFirst())
						)
					)
			}
	}
}

struct CodableModifierApplier: ViewModifier {
	let modifier: CodableModifier
	let next: [CodableModifier]
	
	func body(content: Content) -> some View {
		content
			.modifier(modifier)
			.if(!next.isEmpty) { view in
				view
					.modifier(
						CodableModifierApplier(
							modifier: next.first!,
							next: Array(next.dropFirst())
						)
					)
			}
	}
}
