//
//  EdgeInsets+Uniform.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension EdgeInsets {
	init(uniform: CGFloat) {
		self.init(top: uniform, leading: uniform, bottom: uniform, trailing: uniform)
	}
	static func uniform(_ uniform: CGFloat) -> EdgeInsets {
		.init(uniform: uniform)
	}
	static var zero: EdgeInsets {
		.init(uniform: 0)
	}
}
