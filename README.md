# HypeUI
🚀 HypeUI is a implementation of Apple's SwiftUI DSL style based on UIKit
Want to enjoy SwiftUI syntax with UIKit? It's time to use HypeUI 😊

|  | Why to use HypeUI?  |
---|-----------------
📱 | Support iOS 12+
✨ | HypeUI is compatible with UIKit based project using SwiftUI style syntax
🏄‍♂️ | Reduce UI & Autolayout codes more than 30%
⛳️ | Provide UI binding extension with RxSwift and RxCocoa
🦄 | Easy to use!
✈️ | Improve readability and intuitiveness of complex layouts
🤩 | Have a blast
⛷ | Customize reusable component, design system
❄️ | Test with accessibility Identifier

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Supported Features](#supported_features)
    * [View Modifier](#view_modifier)
    * [Text Modifier](#text_modifier)
    * [Stack Modifier](#stack_modifier)
    * [Image Modifier](#image_modifier)
- [Usage](#usage)
    * [HStack](#hstack)
    * [VStack](#vstack)
    * [ZStack](#zstack)
    * [Button](#button)
    * [Text](#text)
    * [Image](#image)
    * [ScrollView](#scrollview)
    * [Behavior](#behavior)
    * [Spacer](#spacer)
    * [ViewBuildable](#viewbuildable)
- [Dependencies](#dependencies)

## Requirements

- iOS 12.0+
- XCode 13.0+
- Swift 5.0+

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 13+ is required to build HypeUI using Swift Package Manager.

To integrate HypeUI into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/hyperconnect/HypeUI", .upToNextMajor(from: "0.2.0"))
]
```

### CocoaPod

The preferred installation method is with [CocoaPods](https://cocoapods.org). Add the following to your `Podfile`:

```ruby
pod 'HypeUI'
```

## Supported Features

|               | Supported Features  |
----------------|----------------
HStack          | ✅
VStack          | ✅
ZStack          | ✅
Button          | ✅
Text            | ✅
Image           | ✅
ScrollView      | ✅
Behavior        | ✅
Spacer          | ✅
ViewBuildable   | ✅
View Modifier   | ✅
Text Modifier   | ✅
Stack Modifier  | ✅
Image Modifier  | ✅

<a name="view_modifier"></a>
### View Modifier

| name                           | Description  |
---------------------------------|----------------
setHContentHugging               | Sets the priority with which a view resists being made larger than its intrinsic size.
setVContentHugging               | Sets the priority with which a view resists being made larger than its intrinsic size.
setHContentCompressionResistance | Sets the priority with which a view resists being made smaller than its intrinsic size.
setVContentCompressionResistance | Sets the priority with which a view resists being made smaller than its intrinsic size.
makeRatio                        | Modify the ratio of the size of the view.
cornerRadius                     | Modify corner radius.
border                           | Modify border style.
background                       | Modifiy background color.
makeContentMode                  | Modify content mode.
frame                            | Positions this view within an invisible frame with the specified size.
padding                          | Adds an equal padding amount to specific edges of this view.
allowsHitTesting                 | Configures whether this view participates in hit test operations.
masksToBounds                    | Setting sublayers are clipped to the layer’s bounds.
accessibilityIdentifier          | Uses the string you specify to identify the view.

<a name="text_modifier"></a>
### Text Modifier

| name                           | Description  |
---------------------------------|----------------
font                             | Modify text font.
foregroundColor                  | Modify foreground color.
textAligned                      | Modify text alignment
lineLimit                        | The maximum number of lines that text can occupy in a view.
lineBreakMode                    | Modify line break mode.
adjustFontSize                   | Modify adjustsfontsize to fit width
minimumScaleFactor               | Modify minimum scale factor.

<a name="stack_modifier"></a>
### Stack Modifier

| name                           | Description  |
---------------------------------|----------------
distributed                      | Modify stack's distribution layout.

<a name="image_modifier"></a>
### Image Modifier

| name                           | Description  |
---------------------------------|----------------
tintColor                        | Modify tint color.

## Usage

### HStack

```swift
HStack(alinement: .center, spacing: 4) {
    Image(Asset.icStar.image)
        .frame(width: 12, height: 12)
    Text()
        .foregroundColor(UIColor.black)
        .font(UIFont.systemFont(ofSize: 14, weight: .regular))
    Spacer()
}
```

### VStack

```swift
VStack(spacing: 8) {
    Text()
        .foregroundColor(UIColor.black)
        .font(UIFont.systemFont(ofSize: 14, weight: .regular))
    Spacer()
}
```

### ZStack

```swift
ZStack {
    HStack(alinement: .center, spacing: 4) {
        Image(Asset.icStar.image)
            .frame(width: 12, height: 12)
        Text()
            .foregroundColor(UIColor.black)
            .font(UIFont.systemFont(ofSize: 14, weight: .regular))
        Spacer()
    }
    VStack {
        Text()
            .foregroundColor(UIColor.black)
            .font(UIFont.systemFont(ofSize: 14, weight: .regular))
        Spacer()
    }
}
```

### Button

```swift
Button(action: { // DO SOMETHING ex) reactor action, closure }) {
    HStack(alignment: .center, spacing: 5.0) {
        Image("cart")
            .padding(.leading, 10.0)
        Text("Add to Cart")
            .foregroundColor(.black)
            .padding(.all, 10.0)
    }
}
.background(Color.gray)
.cornerRadius(5)
```

### Text

```swift
Text("✨")
    .foregroundColor(UIColor.black)
    .font(UIFont.systemFont(ofSize: 14, weight: .regular))
    .textAligned(.center)
    .background(.white)
    .cornerRadius(16)
```

### Image

```swift
Image(Resource.Profile.placeholderImage)
    .frame(width: 48, height: 48)
    .cornerRadius(24)
```

### ScrollView

```swift
// MARK: Example
ScrollView(.vertical, showsIndicators: false) {
    VStack(alignment: .fill) {
        Image(image: Asset.imgPopupPrivateCall.image)
            .makeRatio(0.46106)
        Spacer()
            .frame(height: 24)
        VStack {
            viewModel.messages.map { message in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                        .font(UIFont.systemFont(ofSize: 14, weight: .regular))
                        .foregroundColor(.Palette.gray04)
                        .frame(width: 6)
                    Text(message)
                        .font(UIFont.systemFont(ofSize: 14, weight: .regular))
                        .foregroundColor(.Palette.gray04)
                        .lineLimit(2)
                        .lineBreakMode(.byCharWrapping)
                    Spacer()
                        .frame(width: 5)
                }
                .padding(.vertical, 8)
            }
        }
        Spacer()
            .frame(height: 16)
    }
}
```

### @Behavior - It's seems like SwiftUI's @State using DynamicLinkable 😎

```swift
@Behavior var isLive: Bool = false
@Behavior var username: String? = nil
@Behavior var profileImageURL: URL? = nil

// MARK Example
final class SearchHostHistoryViewCell: UICollectionViewCell {
    @Behavior var isLive: Bool = false
    @Behavior var username: String? = nil
    @Behavior var profileImageURL: URL? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviewWithFit(
            ZStack {
                VStack(alignment: .center, spacing: 8) {
                    Image(Resource.Profile.placeholderImage)
                        .linked($profileImageURL.flatMapLatest { $0?.getImage(failover: Resource.Profile.placeholderImage) ?? .just(Resource.Profile.placeholderImage) }, keyPath: \.image)
                        .makeContentMode(.scaleAspectFill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(24)
                        .background(.Palette.gray05)
                    Text("")
                        .linked($username, keyPath: \.text)
                        .textAligned(.center)
                        .foregroundColor(.darkModeSupporting(.Palette.gray01, .Palette.dkGray01))
                        .font(UIFont.systemFont(ofSize: 10, weight: .regular))
                        .frame(height: 12)
                }.padding(UIEdgeInsets(top: 12, left: 0, bottom: 4, right: 0))
                VStack(alignment: .center) {
                    Spacer()
                    Text("LIVE")
                        .foregroundColor(.Palette.white)
                        .font(UIFont.systemFont(ofSize: 8, weight: .bold))
                        .padding(UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4))
                        .background(.Palette.red)
                        .cornerRadius(4)
                        .linked($isLive.not(), keyPath: \.isHidden)
                    Spacer()
                        .frame(height: 20)
                }
            }
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

### Spacer
```swift
Spacer()
    .frame(width: 10)
Spacer()
    .frame(height: 20)
```

### ViewBuildable - Customize UI, Make reusable component and Design System by confirming ViewBuildable protocol.

```swift
struct ProfileView: ViewBuildable {
    @Behavior var country: String
    @Behavior var name: String

    func build() -> UIView {
        VStack {
            HStack(alignment: .center, spacing: 12) {
                Text("")
                    .linked($country, keyPath: \.text)
                    .font(UIFont.systemFont(ofSize: 20, weight: .regular))
                    .accessibilityIdentifier("country")
                Text("")
                    .linked($name, keyPath: \.text)
                    .font(UIFont.systemFont(ofSize: 20, weight: .regular))
                    .accessibilityIdentifier("name")
            }
        }
    }
}
```

## Dependencies

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [RxCocoa](https://github.com/ReactiveX/RxSwift/tree/main/RxCocoa)
- [SnapKit](https://github.com/SnapKit/SnapKit)
