//
//  VStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension VStackCodable: View {
	public var body: some View {
		VStack(
			alignment: alignment?.horizontalAlignment ?? .center,
			spacing: spacing?.cgFloat
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}

#endif
