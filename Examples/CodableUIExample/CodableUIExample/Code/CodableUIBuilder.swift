//
//  CodableUIScreen.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI
import CodableUI

struct CodableUIBuilder {
	enum Kind: String, CaseIterable, Identifiable {
		case simple
		case complex
		
		var id: String {
			rawValue
		}
	}
	
	func view(for kind: Kind) -> CodableView {
		switch kind {
		case .simple:
			simpleView
		case .complex:
			complexView
		}
	}
	
	func getCodableView(for kind: Kind) async throws -> CodableView {
		let view = self.view(for: kind)
		let encoded = try JSONEncoder().encode(view)
		print(String(data: encoded, encoding: .utf8) ?? "Error encoding")
		print("\n\n+++++++++++++\n\n")
		let decodedView = try JSONDecoder().decode(CodableView.self, from: encoded)
		return decodedView
	}
}

#Preview {
	CodableKindView(kind: .complex)
}
