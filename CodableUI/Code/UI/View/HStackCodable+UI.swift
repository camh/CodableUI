//
//  HStackCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension HStackCodable: View {
	var body: some View {
		HStack(
			alignment: alignment?.verticalAlignment ?? .center,
			spacing: spacing?.rawValue
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}
