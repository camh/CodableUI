//
//  SpacerCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension SpacerCodable: View {
	public var body: some View {
		Spacer(minLength: minLength?.rawValue)
	}
}
