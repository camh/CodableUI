//
//  CapsuleShapeCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct CapsuleShapeCodable: Codable, Hashable {
	var style: RoundedCornerStyleCodable
	
	init(style: RoundedCornerStyleCodable) {
		self.style = style
	}
}
