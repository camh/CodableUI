//
//  EdgeInsetsCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension EdgeInsetsCodable {
	var edgeInsets: EdgeInsets {
		if let all {
			.uniform(all.rawValue)
		} else {
			.init(
				top: top?.rawValue ?? 0,
				leading: leading?.rawValue ?? 0,
				bottom: bottom?.rawValue ?? 0,
				trailing: trailing?.rawValue ?? 0
			)
		}
	}
}
