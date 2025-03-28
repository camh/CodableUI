//
//  ChildrenViewBuilder.swift
//  CodableUI
//
//  Created by Cam Hunt on 3/27/25.
//

@resultBuilder
public struct ChildrenViewBuilder {
	
	public static func buildArray(_ components: [[ViewCodable]]) -> [ViewCodable] {
		components.flatMap { $0 }
	}
	
	public static func buildExpression(_ expression: ViewCodable) -> [ViewCodable] {
		[expression]
	}
	
	public static func buildExpression(_ expression: [ViewCodable]) -> [ViewCodable] {
		expression
	}
	
	public static func buildBlock(_ children: ViewCodable...) -> [ViewCodable] {
		children
	}
	
	public static func buildBlock(_ children: [ViewCodable]...) -> [ViewCodable] {
		children.flatMap { $0 }
	}
	
	public static func buildEither(first component: [ViewCodable]) -> [ViewCodable] {
		component
	}
	
	public static func buildEither(second component: [ViewCodable]) -> [ViewCodable] {
		component
	}
	
	public static func buildEither(first component: ViewCodable) -> [ViewCodable] {
		[component]
	}
	
	public static func buildEither(second component: ViewCodable) -> [ViewCodable] {
		[component]
	}
	
	public static func buildOptional(_ component: [ViewCodable]?) -> [ViewCodable] {
		component ?? []
	}
	
	// MARK: - ViewCodableProvider -
	
	public static func buildExpression(_ provider: any ViewCodableProvider) -> ViewCodable {
		provider.body
	}
	
	// MARK: - ViewCodable types -
	
	public static func buildExpression(_ view: ProgressViewCodable) -> ViewCodable {
		.progress(view)
	}
	
	public static func buildExpression(_ view: SpacerCodable) -> ViewCodable {
		.spacer(view)
	}
	
	public static func buildExpression(_ view: ShapeCodable) -> ViewCodable {
		.shape(view)
	}
	
	public static func buildExpression(_ view: ColorCodable) -> ViewCodable {
		.color(view)
	}
	
	public static func buildExpression(_ view: TextCodable) -> ViewCodable {
		.text(view)
	}
	
	public static func buildExpression(_ view: ImageCodable) -> ViewCodable {
		.image(view)
	}
	
	public static func buildExpression(_ view: AsyncImageCodable) -> ViewCodable {
		.asyncImage(view)
	}
	
	public static func buildExpression(_ view: ButtonCodable) -> ViewCodable {
		.button(view)
	}
	
	public static func buildExpression(_ view: HStackCodable) -> ViewCodable {
		.hStack(view)
	}
	
	public static func buildExpression(_ view: VStackCodable) -> ViewCodable {
		.vStack(view)
	}
	
	public static func buildExpression(_ view: ZStackCodable) -> ViewCodable {
		.zStack(view)
	}
	
	public static func buildExpression(_ view: LazyVStackCodable) -> ViewCodable {
		.lazyVStack(view)
	}
	
	public static func buildExpression(_ view: ScrollViewCodable) -> ViewCodable {
		.scrollView(view)
	}
	
	// MARK: - Shapes -
	
	public static func buildExpression(_ shape: CircleCodable) -> ViewCodable {
		.shape(.circle(shape))
	}
	
	public static func buildExpression(_ shape: RectangleCodable) -> ViewCodable {
		.shape(.rectangle(shape))
	}
	
	public static func buildExpression(_ shape: EllipseCodable) -> ViewCodable {
		.shape(.ellipse(shape))
	}
	
	public static func buildExpression(_ shape: CapsuleCodable) -> ViewCodable {
		.shape(.capsule(shape))
	}
	
	public static func buildExpression(_ shape: RoundedRectangleCodable) -> ViewCodable {
		.shape(.roundedRectangle(shape))
	}
	
}
