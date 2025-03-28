//
//  CapsuleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension CapsuleCodable: View {
	public var body: some View {
		Capsule(
			style: style.style
		)
		.fill(fill?.color ?? Color.clear)
		.stroke(
			stroke?.color.color ?? Color.clear,
			style: stroke?.strokeStyle.strokeStyle ?? .init(),
			antialiased: stroke?.antialiased ?? true
		)
	}
}

#endif
