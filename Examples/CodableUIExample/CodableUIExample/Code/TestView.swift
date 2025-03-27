//
//  TestView.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/26/25.
//

import SwiftUI
import CodableUI

struct TestView: View {
	var body: some View {
		NavigationStack {
			content
		}
	}
	
	@CodableViewBuilder
	var content: CodableView {
		ScrollViewCodable {
			TextCodable("Hello")
				.font(.largeTitle, design: .serif, weight: .black)
		}
//		.content(
//			.scrollView(
//				ScrollViewCodable(
//					content: .content(
//						.vStack(
//							.children(
//								[
//									.content(.text("Hello, world!"))
//								]
//							)
//						),
//						modifiers: [
//							.frame(.flexible(.maxWidth(.infinity))),
//						]
//					)
//				)
//			),
//			modifiers: [
//				.frame(.flexible(.maxWidth(.infinity))),
//				.backgroundView(
//					.content(
//						.color(.system(.red)),
//						modifiers: [.opacity(0.2)]
//					)
//				),
//				.navigationTitle("Test"),
//				.navigationBarTitleDisplayMode(.inline),
//				.toolbar(
//					ToolbarItemCodable(placement: .topBarTrailing, content: .content(.text("Hello World!")))
//				),
//				.toolbar(
//					ToolbarItemCodable(
//						placement: .bottomBar,
//						content: .content(
//							.text("Hello World!"), modifiers: [.foregroundColor(.system(.red))]
//						)
//					)
//				)
//			]
//		)
	}
}

#Preview {
	TestView()
}
