//
//  ViewCodableRepresentable.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/28/25.
//

public protocol ViewCodableRepresentable {
	@ViewCodableBuilder
	var body: ViewCodable { get }
}
