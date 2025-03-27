//
//  CodableUIBuilder+Complex.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/25/25.
//

import SwiftUI
import CodableUI

extension CodableUIBuilder {
	
	@CodableViewBuilder
	var complexView: CodableView {
		VStackCodable {

			TextCodable("In Sonsequat, Urna ut Felis ac Lacinia Feugiat?")
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(.title2)
			
			AsyncImageCodable(
				url: URL(string: "https://picsum.photos/400/600"),
				resize: .true
			) {
				ImageCodable(systemName: "exclamationmark.triangle.fill")
			} placeholder: {
				ZStackCodable {
					ColorCodable(light: .black, dark: .white)
						.opacity(0.2)
					ProgressViewCodable()
				}
			}
			.frame(maxWidth: .infinity)
			.frame(height: 300)
			.clipShape(.roundedRectangle(cornerRadius: 10))
			
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
			.font(.system(.caption, design: .monospaced))
			
			TextCodable(bodyText)
			
			HStackCodable {
				ButtonCodable {
					ActionCodable(name: "share_article", value: "article_id")
				} label: {
					TextCodable("Share")
				}
				.foregroundStyle(light: .white, dark: .black)
				.padding(.vertical, 8)
				.padding(.horizontal, 15)
				.background {
					ShapeCodableView(.capsule)
						.fill(.gray)
				}
				
				SpacerCodable()
				
				ButtonCodable {
					ActionCodable(name: "read_more", value: "article_id")
				} label: {
					TextCodable("Read more")
				}
				.foregroundStyle(light: .white, dark: .black)
				.padding(.vertical, 8)
				.padding(.horizontal, 15)
				.background {
					ShapeCodableView(.capsule)
						.fill(.blue)
				}
			}
		}
		.foregroundStyle(
			light: ColorCodable(hex: "182226"),
			dark: ColorCodable(hex: "EEF4F7")
		)
		.padding(20)
		.background {
			ShapeCodableView(.roundedRectangle(cornerRadius: 20))
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

#Preview {
	CodableKindView(kind: .complex)
}
