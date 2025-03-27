//
//  CodableView+Wrapped.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension CodableView {
	var wrapped: any ViewCodable {
		switch self {
		case .progress(let progress):
			progress
		case .spacer(let spacer):
			spacer
		case .shape(let shape):
			shape
		case .color(let color):
			color
		case .text(let text):
			text
		case .image(let image):
			image
		case .asyncImage(let asyncImage):
			asyncImage
		case .button(let button):
			button
		case .hStack(let hStack):
			hStack
		case .vStack(let vStack):
			vStack
		case .zStack(let zStack):
			zStack
		case .lazyVStack(let lazyVStack):
			lazyVStack
		case .scrollView(let scrollView):
			scrollView
		}
	}
}
