//
//  CodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension CodableView: View {
	var body: some View {
		content.body
			.if(!modifiers.isEmpty) { view in
				view.modifier(
					CodableModifierApplier(
						modifier: modifiers.first!,
						next: Array(modifiers.dropFirst())
					)
				)
			}
	}
}
