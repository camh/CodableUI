//
//  ImageResizableCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

public struct ImageResizeCodable: Codable, Hashable, Sendable {
	let capInsets: EdgeInsetsCodable?
	let resizingMode: ImageResizingModeCodable?
	
	public init(capInsets: EdgeInsetsCodable? = nil, resizingMode: ImageResizingModeCodable? = nil) {
		self.capInsets = capInsets
		self.resizingMode = resizingMode
	}
	
	public static var `true`: Self {
		.init()
	}
}
