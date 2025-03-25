//
//  ImageCodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ImageCodableView: View {
	var body: some View {
		switch image {
		case .name(let name):
			Image(name)
				.if(resize != nil) { view in
					view.resizable(
						capInsets: resize!.capInsets?.edgeInsets ?? .zero,
						resizingMode: resize!.resizingMode?.mode ?? .stretch
					)
				}
		case .systemName(let systemName):
			Image(systemName: systemName)
				.if(resize != nil) { view in
					view.resizable(
						capInsets: resize!.capInsets?.edgeInsets ?? .zero,
						resizingMode: resize!.resizingMode?.mode ?? .stretch
					)
				}
		}
	}
}
