//
//  ViewCodableProvider.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public protocol ViewCodableProvider {
	@ViewCodableBuilder
	var body: ViewCodable { get }
}
