//
//  View+ConditionalModifier.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension View {
	@ViewBuilder
	func `if`<Content: View>(
		_ condition: Bool,
		transform: (Self) -> Content
	) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}
