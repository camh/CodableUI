//
//  CapsuleShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct CapsuleShapeCodable: Codable, Hashable, Sendable {
	var style: RoundedCornerStyleCodable
	
	public init(style: RoundedCornerStyleCodable) {
		self.style = style
	}
}
