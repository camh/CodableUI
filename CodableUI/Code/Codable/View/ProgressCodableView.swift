//
//  ProgressCodableView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import Foundation

struct ProgressCodableView: Codable, Hashable, Identifiable {
	let id: UUID
	
	static var `default`: Self {
		.init()
	}
	
	init() {
		self.id = UUID()
	}
	
	init(from decoder: any Decoder) throws {
		self.id = UUID()
	}
	
	func encode(to encoder: any Encoder) throws {}
}
