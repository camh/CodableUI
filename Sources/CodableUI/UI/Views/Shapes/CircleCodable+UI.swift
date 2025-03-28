//
//  CircleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension CircleCodable: View {
	public var body: some View {
		Circle()
			.fill(fill?.color ?? Color.clear)
			.stroke(
				stroke?.color.color ?? Color.clear,
				style: stroke?.strokeStyle.strokeStyle ?? .init(),
				antialiased: stroke?.antialiased ?? true
			)
	}
}

#endif
