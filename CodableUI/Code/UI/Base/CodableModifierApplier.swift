//
//  CodableModifierApplier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

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
