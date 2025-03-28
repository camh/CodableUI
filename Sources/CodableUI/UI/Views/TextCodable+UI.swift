//
//  TextCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension TextCodable: View {
	public var body: some View {
		switch textType {
		case .plain(let text):
			Text(text)
		case .markdown(let markdown):
			Text((try? AttributedString(markdown: markdown)) ?? AttributedString(markdown))
		}
	}
}

#endif
