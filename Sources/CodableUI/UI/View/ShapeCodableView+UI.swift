//
//  ShapeCodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ShapeCodableView: View {
	public var body: some View {
		switch shape {
		case .capsule(let capsule):
			Capsule(
				style: capsule.style.style
			)
			.fill(fill?.color ?? Color.clear)
			.stroke(
				stroke?.color.color ?? Color.clear,
				style: stroke?.strokeStyle.strokeStyle ?? .init(),
				antialiased: stroke?.antialiased ?? true
			)
		case .roundedRectangle(let roundedRectangle):
			RoundedRectangle(
				cornerSize: roundedRectangle.cornerSize,
				style: roundedRectangle.style.style
			)
			.fill(fill?.color ?? Color.clear)
			.stroke(
				stroke?.color.color ?? Color.clear,
				style: stroke?.strokeStyle.strokeStyle ?? .init(),
				antialiased: stroke?.antialiased ?? true
			)
		case .circle:
			Circle()
				.fill(fill?.color ?? Color.clear)
				.stroke(
					stroke?.color.color ?? Color.clear,
					style: stroke?.strokeStyle.strokeStyle ?? .init(),
					antialiased: stroke?.antialiased ?? true
				)
		case .rectangle:
			Rectangle()
				.fill(fill?.color ?? Color.clear)
				.stroke(
					stroke?.color.color ?? Color.clear,
					style: stroke?.strokeStyle.strokeStyle ?? .init(),
					antialiased: stroke?.antialiased ?? true
				)
		case .ellipse:
			Ellipse()
				.fill(fill?.color ?? Color.clear)
				.stroke(
					stroke?.color.color ?? Color.clear,
					style: stroke?.strokeStyle.strokeStyle ?? .init(),
					antialiased: stroke?.antialiased ?? true
				)
		}
	}
}
