//
//  TextCaseCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension TextCaseCodable {
	public var textCase: Text.Case {
		switch self {
		case .lowercase: .lowercase
		case .uppercase: .uppercase
		}
	}
}

#endif
