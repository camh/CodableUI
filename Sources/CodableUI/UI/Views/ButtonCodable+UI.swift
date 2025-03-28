//
//  ButtonCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ButtonCodable: View {
	public var body: some View {
		ButtonCodableView(buttonCodable: self)
	}
}

#endif
