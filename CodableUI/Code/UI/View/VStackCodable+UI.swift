//
//  VStackCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension VStackCodable: View {
	var body: some View {
		VStack(
			alignment: alignment?.horizontalAlignment ?? .center,
			spacing: spacing?.rawValue
		) {
			ForEach(children) { child in
				child.body
			}
		}
	}
}
