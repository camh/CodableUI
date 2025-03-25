//
//  CodableContent+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension CodableContent: View {
	var body: some View {
		switch self {
			
		case .progress(let progress):
			progress.body
		case .spacer(let spacer):
			spacer.body
		
		case .shape(let shape):
			shape.body
		case .color(let color):
			color.body
			
		case .text(let text):
			text.body
		case .image(let image):
			image.body
		case .asyncImage(let asyncImage):
			asyncImage.body
			
		case .button(let button):
			button.body
			
		case .hStack(let hStack):
			hStack.body
		case .vStack(let vStack):
			vStack.body
		case .zStack(let zStack):
			zStack.body
		}
	}
}
