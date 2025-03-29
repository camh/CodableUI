//
//  EdgeInsetsCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension EdgeInsetsCodable {
	var edgeInsets: EdgeInsets {
		.init(
			top: top?.cgFloat ?? 0,
			leading: leading?.cgFloat ?? 0,
			bottom: bottom?.cgFloat ?? 0,
			trailing: trailing?.cgFloat ?? 0
		)
	}
}

#endif
