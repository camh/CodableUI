//
//  CatalogView.swift
//  CodableUIExample
//
//  Created by Cam Hunt on 3/28/25.
//

import SwiftUI
import CodableUI

struct CatalogCodableModifier: ViewCodableModifierRepresentable {
	func body(content: () -> ViewCodable) -> ViewCodable {
		content()
			.blur(1)
	}
}

enum CatalogType: String, CaseIterable {
	case complete
	case reduced
	case other
}

struct CatalogCodableView: ViewCodableRepresentable {
	var body: ViewCodable {
		ScrollViewCodable {
			LazyVStackCodable(spacing: 20) {
				
				EmptyViewCodable()
				
				HStackCodable {
					VStackCodable(alignment: .leading) {
						TextCodable("Hello, World!")
							.font(.largeTitle)
							.frame(maxWidth: .infinity, alignment: .leading)
							.multilineTextAlignment(.leading)
						TextCodable("This is CodableUI")
							.font(.body)
							.frame(maxWidth: .infinity, alignment: .leading)
							.multilineTextAlignment(.leading)
					}
					SpacerCodable()
					ImageCodable(systemName: "dot.circle.and.hand.point.up.left.fill")
						.font(.system(.largeTitle, weight: .black))
				}
				.padding(.top, 40)
				
				HStackCodable(spacing: 8) {
					for i in 0..<15 {
						TextCodable(String(i))
							.font(.body)
					}
				}
				.padding(20)
				.modifier(CatalogCodableModifier())
				
				HStackCodable(spacing: 10) {
					for type in CatalogType.allCases {
						TextCodable(type.rawValue)
						if type != CatalogType.allCases.last {
							TextCodable("|")
						}
					}
				}
				.font(.system(.headline, design: .monospaced))
				.padding(.bottom, 20)
				
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
					.frame(idealHeight: 200)
					
				} placeholder: {
					ZStackCodable {
						ColorCodable(light: .black, dark: .white)
							.opacity(0.2)
						ProgressViewCodable()
					}
					.frame(idealHeight: 200)
				}
				.frame(
					maxWidth: .infinity,
					minHeight: 300,
					maxHeight: 300
				)
				.clipShape {
					RoundedRectangleCodable(cornerRadius: 12)
				}
				
				ZStackCodable {
					RectangleCodable()
						.fill(.red)
						.frame(height: 120)
					EllipseCodable()
						.fill(.yellow)
						.frame(width: 300, height: 100)
						.blur(4)
					CapsuleCodable()
						.fill(.green)
						.frame(width: 200, height: 75)
						.blur(6)
					CircleCodable()
						.fill(.blue)
						.frame(width: 60, height: 60, alignment: .bottomTrailing)
						.blur(8)
				}
				.clipShape {
					RoundedRectangleCodable(cornerRadius: 12)
				}
				.frame(maxWidth: .infinity)
				
				HStackCodable {
					ButtonCodable { nil } label: {
						TextCodable("Primary")
					}
					.font(.system(.body, weight: .bold))
					.foregroundStyle(.blue)
					.padding(15)
					.background {
						CapsuleCodable()
							.fill(.blue)
							.opacity(0.2)
					}
					ButtonCodable { nil } label: {
						TextCodable("Secondary")
					}
					.font(.system(.body, weight: .bold))
					.foregroundStyle(.black)
					.padding(15)
					.background {
						CapsuleCodable()
							.fill(.gray)
							.opacity(0.2)
					}
					SpacerCodable()
				}
			}
			.padding(.horizontal, 20)
		}
	}
}

struct CatalogView: View {
	var body: some View {
		CatalogCodableView().body
	}
}

#Preview {
	CatalogView()
}
