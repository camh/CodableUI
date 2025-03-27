//
//  ModifiableContent+SafeArea.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

extension ModifiableContent {
	public func ignoresSafeArea(
		regions: SafeAreaRegionsCodable = .all,
		edges: EdgeCodable = .all
	) -> Self {
		addModifier(.ignoresSafeArea(.init(regions: regions, edges: edges)))
	}
}
