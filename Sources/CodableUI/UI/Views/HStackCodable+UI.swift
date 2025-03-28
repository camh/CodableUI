//
//  HStackCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension HStackCodable: View {
	public var body: some View {
		HStack(
			alignment: alignment?.verticalAlignment ?? .center,
			spacing: spacing?.cgFloat
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}

#endif
