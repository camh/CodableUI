//
//  IgnoreSafeAreaCodable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

public struct IgnoresSafeAreaCodable: Codable, Hashable, Sendable {
	var regions: SafeAreaRegionsCodable
	var edges: EdgeCodable
	
	public init(regions: SafeAreaRegionsCodable = .all, edges: EdgeCodable = .all) {
		self.regions = regions
		self.edges = edges
	}
	
	public static func regions(_ regions: SafeAreaRegionsCodable) -> Self {
		.init(regions: regions)
	}
	
	public static func edges(_ edges: EdgeCodable) -> Self {
		.init(edges: edges)
	}
	
	public func regions(_ regions: SafeAreaRegionsCodable) -> Self {
		var copy = self
		copy.regions = regions
		return copy
	}
	
	public func edges(_ edges: EdgeCodable) -> Self {
		var copy = self
		copy.edges = edges
		return copy
	}
}
