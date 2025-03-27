//
//  ActionCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

public struct ActionCodable: Codable, Hashable, Identifiable, Sendable {
	
	public var name: String
	public var value: String?
	
	public var id: String {
		if let value {
			name + ":" + value
		} else {
			name
		}
	}
	
	public init(name: String, value: String? = nil) {
		self.name = name
		self.value = value
	}
	
	public init?(name: String?, value: String? = nil) {
		guard let name else {
			return nil
		}
		self.name = name
		self.value = value
	}
	
	public static func name(_ name: String, value: String? = nil) -> Self {
		.init(name: name, value: value)
	}
}
