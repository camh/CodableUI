//
//  AsyncImageCodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension AsyncImageCodable: View {
	public var body: some View {
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
					.codableApply(imageModifiers)
			case .failure:
				if let error {
					error
				} else {
					Color.clear
				}
			case .empty:
				if let placeholder {
					placeholder
				} else {
					Color.clear
				}
			@unknown default:
				if let placeholder {
					placeholder
				} else {
					Color.clear
				}
			}
		}
	}
}
