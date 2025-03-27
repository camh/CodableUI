//
//  FrameCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public enum FrameCodable: Codable, Hashable, Sendable {
	case fixed(FixedFrameCodable)
	case flexible(FlexibleFrameCodable)
}
