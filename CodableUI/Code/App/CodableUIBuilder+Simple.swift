//
//  CodableUIBuilder+Simple.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI

extension CodableUIBuilder {
	var simpleView: CodableView {
		CodableView(
			content: .hStack(
				.spacing(30)
				.children(
					[
						.content(
							.image(
								.systemName("globe")
								.resizable()
							),
							modifiers: [
								.frame(.fixed(.uniform(40))),
								.foregroundColor(.system(.green)),
							]
						),
						.content(
							.text(
								.text("Hello, world!")
							),
							modifiers: [
								.frame(.flexible(.maxWidth(.infinity).alignment(.leading))),
								.font(.system(.style(.body).bold())),
								.foregroundColor(
									.dynamic(light: .system(.black), dark: .system(.white))
								),
								.padding(.all(10)),
								.backgroundColor(
									.dynamic(light: .white(0.8), dark: .white(0.2))
								),
							]
						),
					]
				)
			),
			modifiers: [
				.padding(.all(20)),
				.backgroundColor(
					.dynamic(light: .white(0.9), dark: .white(0.1))
				),
			]
		)
	}
}

#Preview {
	CodableKindView(kind: .simple)
}
