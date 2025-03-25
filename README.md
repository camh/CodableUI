# CodableUI

A proof-of-concept that encodes basic SwiftUI views into a `Codable` structure that can be decoded into a native SwiftUI view without type erasure. This could be used to display portions of a SwifUI app via a codable JSON structure from a remote server without updating the app.

## Basic example

``` swift
var basicCodableView: CodableView {
	.content(
		.hStack(
			.children([
				.content(.image(.systemName("globe"))),
				.content(.text("Hello, world!"))
			])
		),
		modifiers: [
			.padding(.all(20)),
			.backgroundColor(.white(0.8))
		]
	)
}
```

This defines a `CodableView` with its `content` defined as an `.hStack` with two children: one `.image` with a SF symbol of `globe` and one `.text` with the string "Hello, world!".

OK, let's encode it.

``` swift
nonisolated func getCodableView() async throws -> CodableView {
	let view = await self.basicCodableView
	let encoded = try JSONEncoder().encode(view)
	let decodedView = try JSONDecoder().decode(CodableView.self, from: encoded)
	return decodedView
}
```

We get our `basicCodableView `. Then we encode it into JSON `Data`, then we decode that JSON `Data` into a `CodableView`. Now let's display that.

``` swift
struct BasicView: View {
	@State private var codableView: CodableView?
	
	var body: some View {
		ScrollView {
			if let codableView {
				codableView
			} else {
				ProgressView()
			}
		}
		.task {
			self.codableView = try? await getCodableView()
		}
	}
}
```

This is the result:

![A basic CodableView](images/BasicView.png)

## Implemented types

Right now I've implemented codable structures for the following views:

- `Spacer`
- `ProgressView`
- `Text`
- `Image`
- `AsyncImage`
- `HStack`
- `VStack`
- `ZStack`
- `Color` (when used for its conformance to `View`)
- `Shape` (again, when used for its conformance to `View`)
- `Button`

And I've implemented these modifiers:

- `.frame(width:height:alignment:)`
- `.frame(minWidth:idealWidth: ...)`
- `.foregroundStyle()` (only supports `Color` at the moment)
- `.background()` (supports `Color` or any supported view from above)
- `.font()` (system and custom font support, with relative sizes or fixed)
- `.multilineTextAlignment(_ alignment:)`
- `.scaledToFill()`
- `.scaledToFit()`
- `.clipped()`
- `.clipShape(_ shape:)` 
- `.blur(radius:)`
- `.opacity(_ opacity:)`
- `.padding(_ insets:)`

These are supported by many, many more codable representations that are dependencies of all those views and modifiers. Font, frame, Color, stroke, shape … these all have codable representations. I even have a codable representation for `CGFloat` because the default implementation does not allow for `.infinity`, which is important to encode for `.frame(minWidth:idealWidth: ...)`.

That said, even with a limited set of views and modifiers, making a fairly complex view is still very much possible:

![A more complex CodableView](images/ComplexView.png)

## Advanced usage

### `AsyncImage`

```
.content(
	.asyncImage(
		.url(
			URL(string: "https://picsum.photos/400/600"),
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
)
```

### `Button`

In order to use a `Button` in a static `Codable` representation, we have to abstract the idea of the button actions into an type that could can be intercepted by the non-codable view which displays the codable view. I do this with `ButtonActionCodable`, a simple wrapper for a non-optional `String` `name` property and an optional `String` `value` property. This gives you an idea of how you could send static codable views to an application with a pre-defined set of actions which the app could interpret into navigation or presentation of other views.

The actions are handled by an environment value with the type `@Sendable (ButtonActionCodable) async -> ()`. Using it in a non-codable view is simple:

``` swift
@State private var buttonAction: ButtonActionCodable?

var body: some View {
	CodableView(
		content: .button(
			.action(
				.name("show_more"),
				label: .content(.text("Show more"))
			)
		)
	)
	.environment(\.codableButtonAction) { [$buttonAction] action  in
		$buttonAction.wrappedValue = action
	}
	.onChange(of: buttonAction) { old, new in
		// handle action
	}
}
```

## Example app

This project contains an example app showing a simple view and a complex view. Each `CodableView` is encoded into JSON and decoded from JSON before being displayed.

## Future

This being a proof-of-concept, I don't intend to turn this into full-fledged framework and maintain it. If you're interested in doing so, email: me at cam dot is. I think this would be very interesting to turn into a package for Vapor or other server-side Swift frameworks to provide server-driven UI to an app. A DSL based with `@resultBuilder` might even be possible to mirror SwiftUI's API from a server.

This proof-of-concept used a lot of a unlabeled associated values, resulting in keys like `_0, _1, _2`. If I were to continue working on this, I would label those associated values and document the schema so it could be reliably generated from non-Swift server languages.

## Thanks

Thanks to Noah Little for [his article on server-driven UI](https://medium.com/@noahlittle199/swiftui-server-driven-ui-with-enum-codable-synthesis-dbb26f7ea0bb) based on enum Codable synthesis. My original implementation type-erased all views with `AnyView`. This article was exactly what I needed to remind me of one of the best ways to encode polymorphic types in Swift: enums with associated values.

## Author

My name is Cam Hunt and you can find me on [Mastodon](https://hachyderm.io/@camhunt) and [Bluesky](https://bsky.app/profile/cam.is).