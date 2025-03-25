//
//  CodableUIBuilder+Complex.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI

extension CodableUIBuilder {
	var complexView: CodableView {
		CodableView(
			content: .vStack(
				.alignment(.leading)
				.children(
					[
						.content(
							.text(
								.text("In Sonsequat, Urna ut Felis ac Lacinia Feugiat?")
							),
							modifiers: [
								.frame(.flexible(.maxWidth(.infinity).alignment(.leading))),
								.font(.system(.style(.title2))),
							]
						),
						.content(
							.asyncImage(
								.url(
									URL(string: "https://picsum.photos/400/600"),
									imageModifiers: [
										.scaledToFill
									],
									errorView: .content(
										.image(.systemName("exclamationmark.triangle.fill"))
									),
									placeholderView: .content(
										.zStack(
											.children(
												[
													.content(
														.color(.dynamic(light: .system(.black), dark: .system(.white))),
														modifiers: [.opacity(0.1)]
													),
													.content(.progress),
												]
											)
										)
									)
								)
								.resizable()
							),
							modifiers: [
								.frame(.flexible(.maxWidth(.infinity))),
								.frame(.fixed(.height(300))),
								.clipShape(.roundedRectangle(cornerRadius: 10)),
							]
						),
						.content(
							.hStack(
								.children(
									[
										.content(.text(.text("By"))),
										.content(
											.text(.text("Author Name")),
											modifiers: [
												.foregroundColor(
													.dynamic(light: .system(.black), dark: .system(.white))
												),
											]
										),
										.content(.spacer(.default)),
										.content(.text(.text("March 22nd, 2025")))
									]
								)
							),
							modifiers: [
								.foregroundColor(
									.dynamic(light: .white(0.4), dark: .white(0.8))
								),
								.padding(.top(5)),
								.padding(.bottom(20)),
								.font(.system(.style(.caption, design: .monospaced))),
							]
						),
						.content(
							.text(
								.text(
								 """
								 In consequat, urna ut lacinia feugiat, augue erat vestibulum elit, in euismod nunc risus id ipsum. Nulla vel cursus purus. Suspendisse mollis molestie elit quis placerat. Suspendisse convallis congue purus vel gravida. Nam vehicula justo ante, vitae congue libero rutrum ut. \n\nIn placerat est arcu, eu porttitor eros porttitor quis. \n\nUt dapibus, elit ac semper lobortis, felis dui tincidunt lorem, ac auctor nisl nunc sed lorem. Nulla facilisi. Phasellus neque quam, tempus at rhoncus at, accumsan a augue. Integer sed sagittis elit.Aliquam nec leo sed nulla faucibus fringilla nec eget risus. Nam blandit mi eget nisi aliquet, a vestibulum massa porttitor. \n\nUt finibus dictum ipsum vitae pretium. Curabitur suscipit orci nunc, non aliquet purus tempus ac. In mattis efficitur erat vitae malesuada. In sagittis commodo nunc ut convallis. \n\nInteger in orci nunc. Cras rutrum augue ut risus bibendum, non tincidunt purus dignissim. Mauris scelerisque felis non tincidunt interdum.
								 """
								)
							),
							modifiers: [
								.lineLimit(10),
								.padding(.bottom(20)),
								.font(.system(.style(.body)))
							]
						),
						.content(
							.hStack(
								.children(
									[
										.content(
											.button(
												ButtonCodable(
													action: .init(name: "share_article", value: "article_id"),
													label: .content(.text(.text("Share")))
												)
											),
											modifiers: [
												.foregroundColor(.dynamic(light: .system(.white), dark: .system(.black))),
												.padding(.vertical(8).horizontal(15)),
												.backgroundView(.content(.shape(.capsule(fill: .system(.gray)))))
											]
										),
										.content(.spacer(.default)),
										.content(
											.button(
												ButtonCodable(
													action: .init(name: "read_more", value: "article_id"),
													label: .content(.text(.text("Read more")))
												)
											),
											modifiers: [
												.foregroundColor(.dynamic(light: .system(.white), dark: .system(.black))),
												.padding(.vertical(8).horizontal(15)),
												.backgroundView(.content(.shape(.capsule(fill: .system(.blue)))))
											]
										)
									]
								)
							)
						)
					]
				)
			),
			modifiers: [
				.foregroundColor(
					.dynamic(light: .hex("182226"), dark: .hex("EEF4F7"))
				),
				.padding(.all(20)),
				.backgroundView(
					.content(
						.shape(
							.roundedRectangle(
								cornerRadius: 20,
								fill: .dynamic(light: .white(0.9), dark: .white(0.1)),
								stroke: .color(
									.dynamic(light: .white(0.8), dark: .white(0.2)),
									lineWidth: 2
								)
							)
						)
					)
				),
				.padding(.all(20)),
				.frame(.flexible(.maxWidth(.infinity)))
			]
		)
	}
}

#Preview {
	CodableKindView(kind: .complex)
}
