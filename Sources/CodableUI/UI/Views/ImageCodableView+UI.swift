//
//  ImageCodableView+UI.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/24/25.
//

import SwiftUI

extension ImageCodable: View {
	public var body: some View {
		imageType.image
			.if(resize != nil) { view in
				view.resizable(
					capInsets: resize!.capInsets?.edgeInsets ?? .zero,
					resizingMode: resize!.resizingMode?.mode ?? .stretch
				)
			}
	}
}
