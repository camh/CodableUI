# CodableUI

A proof-of-concept. `Codable` structures that mirror basic SwiftUI views and conforms those types to `View`. This could be used to display dynamic SwiftUI views in an app via a `Codable` JSON structure from a remote server without updating the app.

This is done without type erasure by using enums with associated values.

## Basic example

``` swift
@ViewCodableBuilder
var exampleView: ViewCodable {
  HStackCodable {
    ImageCodable(systemName: "globe")
    TextCodable("Hello, world!")
  }
  .padding(20)
  .background(.white(0.8))
}
```

This DSL mimics the SwiftUI DSL to make it familiar  for Swift engineers and straightforward to convert SwiftUI views into codable counterparts.

OK, let's encode it.

```swift
nonisolated func getExampleView() async throws -> ViewCodable {
  let view = await self.exampleView
  let encoded = try JSONEncoder().encode(view)
  let decodedView = try JSONDecoder().decode(ViewCodable.self, from: encoded)
  return decodedView
}
```

We get our `basicView `. Then we encode it into JSON `Data`, then we decode that JSON `Data` into a `ViewCodable`. Now let's display that.

```swift
struct BasicView: View {
  @State private var viewCodable: ViewCodable?
  
  var body: some View {
    ScrollView {
      if let viewCodable {
        viewCodable
      } else {
        ProgressView()
      }
    }
    .task {
      self.viewCodable = try? await getExampleView()
    }
  }
}
```

This is the result:

![A basic CodableView](images/BasicView.png)

## Implemented types

Right now I've implemented codable structures for the following views:

- `Spacer` → `SpacerCodable`
- `ProgressView` → `ProgressViewCodable`
- `Text` → `TextCodable`
- `Image` → `ImageCodable`
- `AsyncImage` → `AsyncImageCodable`
- `HStack` → `HStackCodable`
- `VStack` → `VStackCodable`
- `ZStack` → `ZStackCodable`
- `LazyVStack` → `LazyVStackCodable`
- `Color` → `ColorCodable`
- `Shape` → `ShapeCodable`
	- `Rectangle` → `RectangleCodable`
	- `Circle` → `CircleCodable`
	- `Ellipse` → `EllipseCodable`
	- `Capsule` → `CapsuleCodable`
	- `RoundedRectangle` → `RoundedRectangleCodable`
- `Button` → `ButtonCodable`
- `ScrollView` → `ScrollViewCodable`

Generally I follow naming convention of adding "Codable" to a SwiftUI view type name for its codable type name.

These are the implemented modififers:

- `.frame(width:height:alignment:)`
- `.frame(minWidth:idealWidth: ...)`
- `layoutPriority(_ value:)`
- `.foregroundStyle()` (only supports `Color` at the moment)
- `.background()` (supports `Color` or any implemented view above)
- `.font()` (system and custom font support, with relative sizes or fixed)
- `.multilineTextAlignment(_ alignment:)`
- `.lineLimit(_ number:)`
- `.scaledToFill()`
- `.scaledToFit()`
- `.clipped()`
- `.clipShape(_ shape:)` 
- `.blur(_ radius:)`
- `.opacity(_ opacity:)`
- `.padding(_ insets:)`
- `toolbar()`
- `onTapGesture()`

These are supported by many, many more codable representations that are dependencies of all those views and modifiers. Font, frame, Color, stroke, shape … these all have codable representations. I even have a codable representation for `CGFloat` because the default `Codable` implementation for `CGFloat` throws an error when the value is `.infinity`, which is important to encode for `.frame(minWidth:idealWidth: ...)`.

That said, even with a limited set of views and modifiers, making a fairly complex view is still very easy:

<img width="60%" src="images/ComplexView-Light.png">

## Advanced usage

### Color Scheme

The `ColorCodable` enum supports many different colors definitions. You can define a system color like `Color.pink` or `Color.green`. You can define a percentage of white that mirrors `Color(white:opacity)`. You can define a color with a hex string. You can define HSBA and RGBA colors. Since `ColorCodable` is an `indirect` enum, you can also define a dynamic color with light and dark `ColorCodable` values, like this:

```swift 
ColorCodable(light: .black, dark: .white)
```

This allows us to create views that can respond to the current `colorScheme` in the enviroment:

<img width="60%" src="images/ComplexView-Dark.png">

### `AsyncImage`

Since `AsyncImage` is mainly configured with a closure, this was tricky to implement in a static way. I decided that my corollary to `AsyncImage` should mimic the phases provided by `AsyncImage`'s `content` closure, providing ways to provide error and placeholder views and modifiers that will be applied to the image returned in the `content` closure.

```swift
AsyncImageCodable(
  url: URL(string: "https://picsum.photos/400/600")
) { // error closure
  ImageCodable(systemName: "exclamationmark.triangle.fill")
} placeholder: {
  ZStackCodable {
    ColorCodable(light: .black, dark: .white)
      .opacity(0.2)
    ProgressViewCodable()
  }
}
.resizable() // applied to the image returned by AsyncImage's content closure
.frame(maxWidth: .infinity)
.frame(height: 300)
.clipShape {
  RoundedRectangleCodable(cornerRadius: 12)
}
```

This means we can specify any view we want for the error and placeholder states of the `AsyncImage` view:

<img width="60%" src="images/AsyncImage-Placeholder.png">
<img width="60%" src="images/AsyncImage-Error.png">

### `Button`

In order to use a `Button` in a static `Codable` representation, we have to abstract the idea of the button actions into an type that could can be intercepted by the non-codable view which displays the codable view. I do this with `ButtonActionCodable`, a simple wrapper for a non-optional `String` `name` property and an optional `String` `value` property. This gives you an idea of how you could send static codable views to an application with a pre-defined set of actions which the app could interpret into navigation or presentation of other views.

The actions are handled by an environment value with the type `@Sendable (ButtonActionCodable) async -> ()`. Using it in a non-codable view is simple:

```swift
@State private var buttonAction: ActionCodable?

var body: some View {
  ButtonCodable {
    ActionCodable(name: "show_more")
  } label: {
    TextCodable("Show more")
  }
  .environment(\.codableActionHandler) { [$buttonAction] action  in
    $buttonAction.wrappedValue = action
  }
  .onChange(of: buttonAction) { old, new in
    print(new)
  }
}
```

## Example app

This project contains an example app showing a simple view and a complex view. Each `ViewCodable` is encoded into JSON and decoded from JSON before being displayed.

## Future

This being a proof-of-concept, I don't intend to turn this into full-fledged framework and maintain it. If you're interested in doing so, email: me at cam dot is. I think this would be very interesting to turn into a package for Vapor or other server-side Swift frameworks to provide server-driven UI to an app.

This proof-of-concept used a lot of a unlabeled associated values, resulting in keys like `_0, _1, _2`. If I were to continue working on this, I would label those associated values and document the schema so it could be reliably generated from non-Swift server languages.

## Thanks

Thanks to Noah Little for [his article on server-driven UI](https://medium.com/@noahlittle199/swiftui-server-driven-ui-with-enum-codable-synthesis-dbb26f7ea0bb) based on enum Codable synthesis. My original implementation type-erased all views with `AnyView`. This article was exactly what I needed to remind me of one of the best ways to encode polymorphic types in Swift: enums with associated values.

## Author

My name is Cam Hunt and you can find me on [Mastodon](https://hachyderm.io/@camhunt) and [Bluesky](https://bsky.app/profile/cam.is).
