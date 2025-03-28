//
//  ShapeCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

#if canImport(SwiftUI)

import SwiftUI

extension ShapeCodable: View {
	public var body: some View {
		switch self {
		case .capsule(let capsule):
			capsule.body
		case .roundedRectangle(let roundedRectangle):
			roundedRectangle.body
		case .circle(let circle):
			circle.body
		case .rectangle(let rectangle):
			rectangle.body
		case .ellipse(let ellipse):
			ellipse.body
		}
	}
}

#endif
