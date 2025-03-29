//
//  ViewCodable+ModifiableContent.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ViewCodable {
	public var modifiers: [ViewModifierCodable] {
		get { wrapped.modifiers }
		set {
			switch self {
			case .empty(let empty):
				var empty = empty
				empty.modifiers = newValue
				self = .empty(empty)
				
			case .progress(let progress):
				var progress = progress
				progress.modifiers = newValue
				self = .progress(progress)
				
			case .spacer(let spacer):
				var spacer = spacer
				spacer.modifiers = newValue
				self = .spacer(spacer)
				
			case .shape(let shape):
				var shape = shape
				shape.modifiers = newValue
				self = .shape(shape)
				
			case .color(let color):
				var color = color
				color.modifiers = newValue
				self = .color(color)
				
			case .text(let text):
				var text = text
				text.modifiers = newValue
				self = .text(text)
				
			case .image(let image):
				var image = image
				image.modifiers = newValue
				self = .image(image)
				
			case .asyncImage(let asyncImage):
				var asyncImage = asyncImage
				asyncImage.modifiers = newValue
				self = .asyncImage(asyncImage)
				
			case .button(let button):
				var button = button
				button.modifiers = newValue
				self = .button(button)
				
			case .hStack(let hStack):
				var hStack = hStack
				hStack.modifiers = newValue
				self = .hStack(hStack)
				
			case .vStack(let vStack):
				var vStack = vStack
				vStack.modifiers = newValue
				self = .vStack(vStack)
				
			case .zStack(let zStack):
				var zStack = zStack
				zStack.modifiers = newValue
				self = .zStack(zStack)
				
			case .lazyVStack(let lazyVStack):
				var lazyVStack = lazyVStack
				lazyVStack.modifiers = newValue
				self = .lazyVStack(lazyVStack)
				
			case .scrollView(let scrollView):
				var scrollView = scrollView
				scrollView.modifiers = newValue
				self = .scrollView(scrollView)
			}
		}
	}
}
