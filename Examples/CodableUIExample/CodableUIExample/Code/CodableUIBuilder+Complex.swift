//
//  CodableUIBuilder+Complex.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI
import CodableUI

extension CodableUIBuilder {
	
	@ViewCodableBuilder
	var complexView: ViewCodable {
		VStackCodable {

			TextCodable("In Sonsequat, Urna ut Felis ac Lacinia Feugiat?")
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(.title2)
			
			AsyncImageCodable(
				url: URL(string: "https://picsum.photos/600/500")
			) { image in
				image
					.resizable()
					.scaledToFill()
			} error: {
				ZStackCodable {
					ColorCodable(light: .black, dark: .white)
						.opacity(0.2)
					ImageCodable(systemName: "exclamationmark.triangle.fill")
				}
			} placeholder: {
				ZStackCodable {
					ColorCodable(light: .black, dark: .white)
						.opacity(0.2)
					ProgressViewCodable()
				}
			}
			.frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
			.clipShape {
				RoundedRectangleCodable(cornerRadius: 12)
			}
			
			HStackCodable {
				TextCodable("by")
				TextCodable("Author Name")
					.foregroundStyle(light: .black, dark: .white)
				SpacerCodable(minLength: 0)
				TextCodable("March 22nd, 2025")
			}
			.foregroundStyle(light: .white(0.4), dark: .white(0.8))
			.padding(.top, 5)
			.padding(.bottom, 20)
			.font(.caption.design(.monospaced))
			
			TextCodable(bodyText)
			
			HStackCodable {
				ArticleButtonCodable(title: "Share", background: .gray) {
					ActionCodable(name: "share_article", value: "article_id")
				}
				SpacerCodable()
				ArticleButtonCodable(title: "Read more", background: .blue) {
					ActionCodable(name: "read_more", value: "article_id")
				}
			}
		}
		.foregroundStyle(
			light: ColorCodable(hex: "182226"),
			dark: ColorCodable(hex: "EEF4F7")
		)
		.padding(20)
		.background {
			RoundedRectangleCodable(cornerRadius: 20)
				.fill(ColorCodable(light: .white(0.9), dark: .white(0.1)))
				.stroke(ColorCodable(light: .white(0.8), dark: .white(0.2)))
		}
		.padding(20)
		.frame(maxWidth: .infinity)
	}
	
	var bodyText: String {
	 """
	 In consequat, urna ut lacinia feugiat, augue erat vestibulum elit, in euismod nunc risus id ipsum. Nulla vel cursus purus. Suspendisse mollis molestie elit quis placerat. Suspendisse convallis congue purus vel gravida. Nam vehicula justo ante, vitae congue libero rutrum ut. \n\nIn placerat est arcu, eu porttitor eros porttitor quis. \n\nUt dapibus, elit ac semper lobortis, felis dui tincidunt lorem, ac auctor nisl nunc sed lorem. Nulla facilisi. Phasellus neque quam, tempus at rhoncus at, accumsan a augue. Integer sed sagittis elit.Aliquam nec leo sed nulla faucibus fringilla nec eget risus. Nam blandit mi eget nisi aliquet, a vestibulum massa porttitor. \n\nUt finibus dictum ipsum vitae pretium. Curabitur suscipit orci nunc, non aliquet purus tempus ac. In mattis efficitur erat vitae malesuada. In sagittis commodo nunc ut convallis. \n\nInteger in orci nunc. Cras rutrum augue ut risus bibendum, non tincidunt purus dignissim. Mauris scelerisque felis non tincidunt interdum.
	 """
	}
}

struct ArticleButtonStyle: ViewCodableModifierRepresentable {
	let background: ColorCodable
	func body(content: () -> ViewCodable) -> ViewCodable {
		content()
			.foregroundStyle(light: .white, dark: .black)
			.padding(.vertical, 8)
			.padding(.horizontal, 15)
			.background {
				CapsuleCodable()
					.fill(background)
			}
	}
}

struct ArticleButtonCodable: ViewCodableRepresentable {
	
	let title: String
	let background: ColorCodable
	let action: () -> ActionCodable?
	
	var body: ViewCodable {
		ButtonCodable(action: action) {
			TextCodable(title)
		}
		.modifier(ArticleButtonStyle(background: background))
	}
}

#Preview {
	CodableKindView(kind: .complex)
}
