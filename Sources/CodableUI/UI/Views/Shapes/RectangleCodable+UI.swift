//
//  RectangleCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension RectangleCodable: View {
	public var body: some View {
		Rectangle()
			.fill(fill?.color ?? Color.clear)
			.stroke(
				stroke?.color.color ?? Color.clear,
				style: stroke?.strokeStyle.strokeStyle ?? .init(),
				antialiased: stroke?.antialiased ?? true
			)
	}
}

#endif
