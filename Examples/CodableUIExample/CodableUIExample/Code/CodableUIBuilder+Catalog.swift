//
//  CodableUIBuilder+Catalog.swift
//  CodableUIExample
//
//  Created by Cam Hunt on 3/28/25.
//

import SwiftUI
import CodableUI

extension CodableUIBuilder {
	@ViewCodableBuilder
	var catalog: ViewCodable {
		CatalogCodableView()
	}
}

struct CatalogButtonStyle: ViewCodableModifierRepresentable {
	let color: ColorCodable
	
	func body(content: () -> ViewCodable) -> ViewCodable {
		content()
			.font(.body.bold())
			.foregroundStyle(color)
			.padding(15)
			.background {
				CapsuleCodable()
					.fill(color.opacity(0.2))
			}
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
				.blur(radius: 1)
				
				HStackCodable(spacing: 10) {
					for type in CatalogType.allCases {
						switch type {
							case .complete:
								TextCodable(type.rawValue)
								.foregroundStyle(.pink)
						case .reduced:
							TextCodable(type.rawValue)
								.foregroundStyle(.purple)
						case .other:
							TextCodable(type.rawValue)
								.foregroundStyle(.blue)
						}
						if type != CatalogType.allCases.last {
							TextCodable("|")
						}
					}
				}
				.tracking(2)
				.foregroundStyle(.cyan)
				.frame(maxWidth: .infinity)
				.padding(20)
				.overlay {
					CapsuleCodable()
						.fill(.indigo.opacity(0.5))
						.stroke(.orange, lineWidth: 4)
				}
				.font(.system(.headline, design: .monospaced))
				
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
						.blur(radius: 4)
					CapsuleCodable()
						.fill(.green)
						.frame(width: 200, height: 75)
						.blur(radius: 6)
					CircleCodable()
						.fill(.blue)
						.frame(width: 60, height: 60, alignment: .bottomTrailing)
						.blur(radius: 8)
				}
				.clipShape {
					RoundedRectangleCodable(cornerRadius: 12)
				}
				.frame(maxWidth: .infinity)
				
				HStackCodable {
					ButtonCodable {
						ActionCodable(name: "primary_button", value: "some_param")
					} label: {
						TextCodable("Primary")
					}
					.modifier(CatalogButtonStyle(color: .blue))
					ButtonCodable {
						ActionCodable(name: "primary_button", value: "some_param")
					} label: {
						TextCodable("Destructive")
					}
					.modifier(CatalogButtonStyle(color: .red))
					ButtonCodable {
						ActionCodable(name: "primary_button", value: "some_param")
					} label: {
						TextCodable("Secondary")
					}
					.modifier(CatalogButtonStyle(color: .gray))
					SpacerCodable(minLength: 0)
				}
			}
			.padding(.horizontal, 20)
		}
	}
}

#Preview {
	CodableKindView(kind: .catalog)
}
