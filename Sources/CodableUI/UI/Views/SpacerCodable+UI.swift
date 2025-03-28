//
//  SpacerCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension SpacerCodable: View {
	public var body: some View {
		Spacer(minLength: minLength?.cgFloat)
	}
}

#endif
