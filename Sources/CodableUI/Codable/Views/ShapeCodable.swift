//
//  ShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

public enum ShapeCodable: CodableShape {
	
	case rectangle(RectangleCodable)
	case circle(CircleCodable)
	case ellipse(EllipseCodable)
	case capsule(CapsuleCodable)
	case roundedRectangle(RoundedRectangleCodable)
	
	public var id: UUID {
		wrapped.id
	}
	
	var wrapped: any CodableShape {
		switch self {
		case .rectangle(let rectangle): rectangle
		case .circle(let circle): circle
		case .ellipse(let ellipse): ellipse
		case .capsule(let capsule): capsule
		case .roundedRectangle(let roundedRectangle): roundedRectangle
		}
	}
}
