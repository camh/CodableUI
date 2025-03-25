//
//  CodableContent.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

indirect enum CodableContent: Codable, Hashable, Identifiable {
	
	case progress(ProgressCodableView)
	case spacer(SpacerCodable)

	case shape(ShapeCodableView)
	case color(ColorCodableView)
	
	case text(TextCodable)
	
	case image(ImageCodableView)
	case asyncImage(AsyncImageCodableView)
	
	case button(ButtonCodable)
	
	case hStack(HStackCodable)
	case vStack(VStackCodable)
	case zStack(ZStackCodable)
	
	var id: UUID {
		switch self {
		case .progress(let progress):
			progress.id
		case .spacer(let spacer):
			spacer.id
		
		case .shape(let shape):
			shape.id
		case .color(let color):
			color.id
			
		case .text(let text):
			text.id
		case .image(let image):
			image.id
		case .asyncImage(let asyncImage):
			asyncImage.id
			
		case .button(let button):
			button.id
			
		case .hStack(let hStack):
			hStack.id
		case .vStack(let vStack):
			vStack.id
		case .zStack(let zStack):
			zStack.id
		}
	}
}

extension CodableContent {
	static var spacer: Self {
		.spacer(.default)
	}
	static var progress: Self {
		.progress(.default)
	}
	static func text(_ string: String) -> Self {
		.text(.text(string))
	}
}
