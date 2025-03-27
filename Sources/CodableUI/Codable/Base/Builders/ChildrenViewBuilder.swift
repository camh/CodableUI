//
//  ChildrenViewBuilder.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

@resultBuilder
public struct ChildrenViewBuilder {
	
	public static func buildArray(_ components: [[CodableView]]) -> [CodableView] {
		components.flatMap { $0 }
	}
	
	public static func buildExpression(_ expression: CodableView) -> [CodableView] {
		[expression]
	}
	
	public static func buildExpression(_ expression: [CodableView]) -> [CodableView] {
		expression
	}
	
	public static func buildBlock(_ children: CodableView...) -> [CodableView] {
		children
	}
	
	public static func buildBlock(_ children: [CodableView]...) -> [CodableView] {
		children.flatMap { $0 }
	}
	
	public static func buildEither(first component: [CodableView]) -> [CodableView] {
		component
	}
	
	public static func buildEither(second component: [CodableView]) -> [CodableView] {
		component
	}
	
	public static func buildEither(first component: CodableView) -> [CodableView] {
		[component]
	}
	
	public static func buildEither(second component: CodableView) -> [CodableView] {
		[component]
	}
	
	public static func buildOptional(_ component: [CodableView]?) -> [CodableView] {
		component ?? []
	}
	
	// MARK: - CodableView types -
	
	public static func buildExpression(_ view: ProgressViewCodable) -> CodableView {
		.progress(view)
	}
	
	public static func buildExpression(_ view: SpacerCodable) -> CodableView {
		.spacer(view)
	}
	
	public static func buildExpression(_ view: ShapeCodableView) -> CodableView {
		.shape(view)
	}
	
	public static func buildExpression(_ view: ColorCodable) -> CodableView {
		.color(view)
	}
	
	public static func buildExpression(_ view: TextCodable) -> CodableView {
		.text(view)
	}
	
	public static func buildExpression(_ view: ImageCodable) -> CodableView {
		.image(view)
	}
	
	public static func buildExpression(_ view: AsyncImageCodable) -> CodableView {
		.asyncImage(view)
	}
	
	public static func buildExpression(_ view: ButtonCodable) -> CodableView {
		.button(view)
	}
	
	public static func buildExpression(_ view: HStackCodable) -> CodableView {
		.hStack(view)
	}
	
	public static func buildExpression(_ view: VStackCodable) -> CodableView {
		.vStack(view)
	}
	
	public static func buildExpression(_ view: ZStackCodable) -> CodableView {
		.zStack(view)
	}
	
	public static func buildExpression(_ view: LazyVStackCodable) -> CodableView {
		.lazyVStack(view)
	}
	
	public static func buildExpression(_ view: ScrollViewCodable) -> CodableView {
		.scrollView(view)
	}
}
