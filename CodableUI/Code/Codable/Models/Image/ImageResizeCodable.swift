//
//  ImageResizableCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

struct ImageResizeCodable: Codable, Hashable {
	let capInsets: EdgeInsetsCodable?
	let resizingMode: ImageResizingModeCodable?
	
	init(capInsets: EdgeInsetsCodable? = nil, resizingMode: ImageResizingModeCodable? = nil) {
		self.capInsets = capInsets
		self.resizingMode = resizingMode
	}
}
