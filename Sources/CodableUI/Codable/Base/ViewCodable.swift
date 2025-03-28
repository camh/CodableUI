//
//  ViewCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public indirect enum ViewCodable: CodableView {
	
	case empty(EmptyViewCodable)
	
	case progress(ProgressViewCodable)
	case spacer(SpacerCodable)

	case shape(ShapeCodable)
	case color(ColorCodable)
	
	case text(TextCodable)
	case image(ImageCodable)
	case asyncImage(AsyncImageCodable)
	
	case button(ButtonCodable)
	
	case hStack(HStackCodable)
	case vStack(VStackCodable)
	case zStack(ZStackCodable)
	
	case lazyVStack(LazyVStackCodable)
	
	case scrollView(ScrollViewCodable)
	
	public var id: UUID {
		wrapped.id
	}
}
