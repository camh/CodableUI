//
//  ZStackCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

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
