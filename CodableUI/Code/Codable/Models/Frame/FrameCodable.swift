//
//  FrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

enum FrameCodable: Codable, Hashable {
	case fixed(FixedFrameCodable)
	case flexible(FlexibleFrameCodable)
}
