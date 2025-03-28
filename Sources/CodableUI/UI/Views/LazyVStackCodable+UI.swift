//
//  LazyVStackCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension LazyVStackCodable: View {
	public var body: some View {
		LazyVStack(
			alignment: alignment?.horizontalAlignment ?? .center,
			spacing: spacing?.rawValue
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}

#endif
