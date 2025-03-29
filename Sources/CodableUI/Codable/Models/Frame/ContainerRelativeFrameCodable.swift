//
//  ContainerRelativeFrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public struct ContainerRelativeFrameCodable: Codable, Hashable, Sendable {
	let axis: AxisCodable
	let alignment: AlignmentCodable
	let scale: CGFloatCodable?
	
	public init(
		_ axis: AxisCodable,
		alignment: AlignmentCodable = .center,
		scale: CGFloatCodable? = nil
	) {
		self.axis = axis
		self.alignment = alignment
		self.scale = scale
	}
}
