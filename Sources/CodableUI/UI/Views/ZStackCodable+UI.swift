//
//  ZStackCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ZStackCodable: View {
	public var body: some View {
		ZStack(
			alignment: alignment?.alignment ?? .center
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}

#endif
