//
//  EdgeCodable+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI

extension EdgeCodable {
	var edges: Edge.Set {
		switch self {
		case .all: .all
		case .horizontal: .horizontal
		case .vertical: .vertical
		case .top: .top
		case .bottom: .bottom
		case .leading: .leading
		case .trailing: .trailing
		}
	}
}
