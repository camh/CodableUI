//
//  AsyncImageCodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension AsyncImageCodable: View {
	var body: some View {
		AsyncImage(
			url: url,
			scale: scale?.rawValue ?? 1
		) { phase in
			switch phase {
			case .success(let image):
				image
					.if(resize != nil) { view in
						view.resizable(
							capInsets: resize!.capInsets?.edgeInsets ?? .zero,
							resizingMode: resize!.resizingMode?.mode ?? .stretch
						)
					}
					.if(imageModifiers?.isEmpty == false) { view in
						view.modifier(
							CodableModifierApplier(
								modifier: imageModifiers!.first!,
								next: Array(imageModifiers!.dropFirst())
							)
						)
					}
			case .failure:
				if let errorView {
					errorView
				} else {
					Color.clear
				}
			case .empty:
				if let placeholderView {
					placeholderView
				} else {
					Color.clear
				}
			@unknown default:
				if let placeholderView {
					placeholderView
				} else {
					Color.clear
				}
			}
		}
	}
}
