//
//  ModifiableContent+Frame.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func frame(
		width: CGFloatCodable? = nil,
		height: CGFloatCodable? = nil,
		alignment: AlignmentCodable = .center
	) -> Self {
		let frame = FixedFrameCodable(
			width: width,
			height: height,
			alignment: alignment
		)
		return addModifier(.frame(.fixed(frame)))
	}
	
	public func frame(
		minWidth: CGFloatCodable? = nil,
		idealWidth: CGFloatCodable? = nil,
		maxWidth: CGFloatCodable? = nil,
		minHeight: CGFloatCodable? = nil,
		idealHeight: CGFloatCodable? = nil,
		maxHeight: CGFloatCodable? = nil,
		alignment: AlignmentCodable? = nil
	) -> Self {
		let frame = FlexibleFrameCodable(
			minWidth: minWidth,
			idealWidth: idealWidth,
			maxWidth: maxWidth,
			minHeight: minHeight,
			idealHeight: idealHeight,
			maxHeight: maxHeight,
			alignment: alignment
		)
		return addModifier(.frame(.flexible(frame)))
	}
}
