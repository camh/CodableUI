//
//  ScrollViewCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

extension ScrollViewCodable: View {
	public var body: some View {
		ScrollView(axis.axis) {
			content.body
		}
	}
}
