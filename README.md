# HypeUI
🚀 HypeUI is a implementation of Apple's SwiftUI DSL style based on UIKit
Want to enjoy SwiftUI syntax with UIKit? It's time to use HypeUI 😊

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)

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
    * [ScrollView Modifier](#scrollview_modifier)
    * [Toggle Modifier](#toggle_modifier)
    * [Slider Modifier](#slider_modifier)
    * [Stepper Modifier](#stepper_modifier)
    * [ProgressView Modifier](#progressview_modifier)
    * [ActivityIndicator Modifier](#activityindicator_modifier)
    * [PageControl Modifier](#pagecontrol_modifier)
    * [Image Modifier](#image_modifier)
    * [UIKit Extensions](#uikit_extensions)
- [Usage](#usage)
    * [HStack](#hstack)
    * [VStack](#vstack)
    * [ZStack](#zstack)
    * [Button](#button)
    * [Text](#text)
    * [Image](#image)
    * [ScrollView](#scrollview)
    * [Toggle](#toggle)
    * [Slider](#slider)
    * [Stepper](#stepper)
    * [ProgressView](#progressview)
    * [ActivityIndicator](#activityindicator)
    * [PageControl](#pagecontrol)
    * [Behavior](#behavior)
    * [Spacer](#spacer)
    * [LinearGradient](#lineargradient)
    * [ViewBuildable](#viewbuildable)
    * [UIKit Extensions](#uikit_extensions_usage)
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
    .package(url: "https://github.com/hyperconnect/HypeUI", .upToNextMajor(from: "0.3.0"))
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
LinearGradient  | ✅
AlignmentView   | ✅
ViewBuildable   | ✅
View Modifier   | ✅
Text Modifier   | ✅
Stack Modifier  | ✅
ScrollView Modifier  | ✅
Toggle (UISwitch) | ✅
Slider (UISlider) | ✅
Stepper (UIStepper) | ✅
ProgressView (UIProgressView) | ✅
ActivityIndicator (UIActivityIndicatorView) | ✅
PageControl (UIPageControl) | ✅
Image Modifier  | ✅
UIKit Extensions | ✅

<a name="view_modifier"></a>
### View Modifier

| name                           | Description  |
---------------------------------|----------------
setHContentHugging               | Adjusts the priority for a view to resist growing beyond its intrinsic size horizontally.
setVContentHugging               | Adjusts the priority for a view to resist growing beyond its intrinsic size vertically.
setHContentCompressionResistance | Adjusts the priority for a view to resist shrinking below its intrinsic size horizontally.
setVContentCompressionResistance | Adjusts the priority for a view to resist shrinking below its intrinsic size vertically.
makeRatio                        | Sets the aspect ratio constraint for the view's size.
cornerRadius                     | Applies a corner radius to the view to create rounded corners.
border                           | Adds a border with specified color and width to the view.
background                       | Sets the background color of the view.
makeContentMode                  | Sets the content mode of the view.
frame                            | Positions the view within a specified frame size.
padding                          | Adds padding around specific edges of the view.
allowsHitTesting                 | Enables or disables the view's interaction with touch events.
masksToBounds                    | Clips the view's sublayers to its boundaries.
accessibilityIdentifier          | Assigns an identifier used to find this view in tests.
overlay                          | Places specified views in front of the view.
background                       | Layers the views that you specify behind this view.
center                           | Centers the view within a new parent view.
tint                             | Applies a tint color to the view.
opacity                          | Sets the transparency level of the view.
scaleEffect                      | Scales the view by specified factors along the x and y axes.
rotationEffect                   | Rotates the view by a specified angle around a given anchor point.
hidden                           | Sets whether the view is hidden.
disabled                         | Sets whether user interactions are disabled for this view.
tag                              | Sets an integer identifier for the view.
zIndex                           | Sets the order in which the view is composited on the z axis.
fixedSize                        | Fixes the view at its ideal size by setting compression resistance to required.

<a name="text_modifier"></a>
### Text Modifier

| name                           | Description  |
---------------------------------|----------------
font                             | Sets the font of the text.
foregroundColor                  | Applies a foreground color to the text.
textAligned                      | Sets the alignment of the text within its container.
lineLimit                        | Specifies the maximum number of lines the text can span.
lineBreakMode                    | Defines how text wraps when it reaches the edge of its container.
adjustFontSize                   | Adjusts the font size of the text to fit its width.
minimumScaleFactor               | Sets the smallest multiplier for text size reduction to fit the width.
preferredMaxLayoutWidth          | Sets the preferred maximum width for the Text object and enables method chaining.
baselineAdjusted                 | Applies a baseline adjustment to the Text object and enables method chaining.

<a name="stack_modifier"></a>
### Stack Modifier

| name                           | Description  |
---------------------------------|----------------
distributed                      | Modify stack's distribution layout.
spacing                          | Sets the spacing between arranged subviews.
alignment                        | Sets the alignment of arranged subviews perpendicular to the stack view's axis.
layoutMargins                    | Sets the layout margins for the stack view and enables margin-relative layout.

<a name="scrollview_modifier"></a>
### ScrollView Modifier

| name                           | Description  |
---------------------------------|----------------
bounces                          | Modify scroll view bounces.
isPagingEnabled                  | Modify scroll view paging enabled.
isScrollEnabled                  | Modify scroll view enabled.
contentInset                     | Sets the custom distance that the content view is inset from the safe area or scroll view edges.
scrollIndicatorInsets            | Sets the distance the scroll indicators are inset from the edge of the scroll view.
alwaysBounceVertical             | Sets whether the scroll view always bounces vertically, regardless of content size.
alwaysBounceHorizontal           | Sets whether the scroll view always bounces horizontally, regardless of content size.
decelerationRate                 | Sets the rate at which the scroll view decelerates to a stop.
showsVerticalScrollIndicator     | Sets whether the scroll view shows the vertical scroll indicator.
showsHorizontalScrollIndicator   | Sets whether the scroll view shows the horizontal scroll indicator.
contentOffset                    | Sets the offset of the content origin from the scroll view origin.

<a name="toggle_modifier"></a>
### Toggle Modifier (UISwitch)

| name                           | Description  |
---------------------------------|----------------
isOn                             | Sets the on/off state of the switch.
onTintColor                      | Sets the color used to tint the appearance of the switch when it is turned on.
thumbTintColor                   | Sets the color used to tint the color of the thumb.
tintColor                        | Sets the color used to tint the outline of the switch when it is turned off.
onChange                         | Adds an action to perform when the switch value changes.

<a name="slider_modifier"></a>
### Slider Modifier (UISlider)

| name                           | Description  |
---------------------------------|----------------
value                            | Sets the current value of the slider.
minimumValue                     | Sets the minimum value of the slider.
maximumValue                     | Sets the maximum value of the slider.
isContinuous                     | Sets whether changes in the slider's value generate continuous update events.
minimumTrackTintColor            | Sets the color used to tint the default minimum track images.
maximumTrackTintColor            | Sets the color used to tint the default maximum track images.
thumbTintColor                   | Sets the color used to tint the default thumb images.
onChange                         | Adds an action to perform when the slider value changes.

<a name="stepper_modifier"></a>
### Stepper Modifier (UIStepper)

| name                           | Description  |
---------------------------------|----------------
value                            | Sets the numeric value of the stepper.
minimumValue                     | Sets the lowest possible numeric value for the stepper.
maximumValue                     | Sets the highest possible numeric value for the stepper.
stepValue                        | Sets the step, or increment, value for the stepper.
wraps                            | Sets whether the stepper value wraps around from the maximum to minimum value.
autorepeat                       | Sets whether the stepper automatically repeats when a user presses and holds a stepper button.
isContinuous                     | Sets whether the stepper sends value changes during user interaction or only when interaction ends.
onChange                         | Adds an action to perform when the stepper value changes.

<a name="progressview_modifier"></a>
### ProgressView Modifier (UIProgressView)

| name                           | Description  |
---------------------------------|----------------
progress                         | Sets the current progress of the progress view.
progressTintColor                | Sets the color shown for the portion of the progress bar that is filled.
trackTintColor                   | Sets the color shown for the portion of the progress bar that is not filled.
progressViewStyle                | Sets the current graphical style of the progress view.
progressImage                    | Sets the image to use for the progress portion of the progress bar.
trackImage                       | Sets the image to use for the tracking portion of the progress bar.

<a name="activityindicator_modifier"></a>
### ActivityIndicator Modifier (UIActivityIndicatorView)

| name                           | Description  |
---------------------------------|----------------
style                            | Sets the basic appearance of the activity indicator.
color                            | Sets the color of the activity indicator.
hidesWhenStopped                 | Sets whether the receiver is hidden when the animation stops.
animating                        | Starts or stops animating the activity indicator.

<a name="pagecontrol_modifier"></a>
### PageControl Modifier (UIPageControl)

| name                           | Description  |
---------------------------------|----------------
currentPage                      | Sets the current page displayed by the page control.
numberOfPages                    | Sets the number of pages the page control shows.
pageIndicatorTintColor           | Sets the tint color to apply to the page indicator.
currentPageIndicatorTintColor    | Sets the tint color to apply to the current page indicator.
hidesForSinglePage               | Sets whether the page control is hidden when there is only one page.
onChange                         | Adds an action to perform when the current page changes.

<a name="image_modifier"></a>
### Image Modifier (UIImageView)

| name                           | Description  |
---------------------------------|----------------
imaged                           | Sets the image displayed in the image view.
highlightedImage                 | Sets the highlighted image displayed in the image view.
isHighlighted                    | Sets whether the image view is highlighted.
animationImages                  | Sets the images to use for an animation with the total duration.
symbolConfiguration              | Sets the configuration values to use when rendering the image (iOS 13+).

<a name="uikit_extensions"></a>
### UIKit Extensions

| name                           | Description  |
---------------------------------|----------------
shadow                           | Applies a shadow to the view with specified properties
dropShadow                       | Applies a simple drop shadow with default styling
removeShadow                     | Removes any shadow from the view
debouncedAction                  | Adds debounced action to control events with specified delay
keyboardType                     | Sets the keyboard type for text input fields
autocorrectionDisabled           | Sets whether to disable autocorrection for text input
textContentType                  | Sets the text content type for autofill suggestions
textFieldStyle                   | Sets the text field's border style
submitLabel                      | Sets the submit label for the return key
textInputAutocapitalization      | Sets the text capitalization style
secureField                      | Sets whether the text field is a secure entry (password field)
textEditorEditable               | Sets whether the text view is editable
textEditorScrollable             | Sets whether the text view is scrollable
scrollContentBackground          | Hides the scroll content background
selection                        | Sets the selected segment index for segmented control (SwiftUI-style)
pickerEnabled                    | Sets whether the segmented control is enabled
selectedSegmentTintColor         | Sets the background color for the selected segment
segmentedControlBackgroundColor  | Sets the background color of the segmented control
momentary                        | Sets whether the control momentarily highlights segments when touched
onSelectionChange                | Adds an action for value changed events

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

### Toggle

```swift
UISwitch()
    .isOn(true)
    .onTintColor(.systemGreen)
    .thumbTintColor(.white)
    .onChange { isOn in
        print("Switch is now: \(isOn)")
    }
```

### Slider

```swift
UISlider()
    .minimumValue(0)
    .maximumValue(100)
    .value(50)
    .minimumTrackTintColor(.systemBlue)
    .maximumTrackTintColor(.systemGray)
    .onChange { value in
        print("Slider value: \(value)")
    }
```

### Stepper

```swift
UIStepper()
    .minimumValue(0)
    .maximumValue(10)
    .stepValue(1)
    .value(3)
    .wraps(false)
    .onChange { value in
        print("Stepper value: \(value)")
    }
```

### ProgressView

```swift
UIProgressView()
    .progressViewStyle(.default)
    .progress(0.5)
    .progressTintColor(.systemBlue)
    .trackTintColor(.systemGray5)
```

### ActivityIndicator

```swift
UIActivityIndicatorView()
    .style(.medium)
    .color(.systemGray)
    .hidesWhenStopped(true)
    .animating(true)
```

### PageControl

```swift
UIPageControl()
    .numberOfPages(5)
    .currentPage(0)
    .pageIndicatorTintColor(.systemGray3)
    .currentPageIndicatorTintColor(.systemBlue)
    .hidesForSinglePage(true)
    .onChange { page in
        print("Current page: \(page)")
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

### LinearGradient
```swift
ProfileView()
    .background(
        LinearGradient(
            gradient: Gradient(
                stops: [
                    Stop(color: UIColor.black, location: 1.0),
                    Stop(color: UIColor.black, location: 0.2),
                    Stop(color: UIColor.black, location: 0.0)
                ]),
            startPoint: .top,
            endPoint: .bottom
        )
    )
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

<a name="uikit_extensions_usage"></a>
### UIKit Extensions

#### Shadow
```swift
// Default shadow
Text("Drop Shadow")
    .background(.systemBlue)
    .cornerRadius(8)
    .shadow()

// Custom shadow
Text("Custom Shadow")
    .background(.systemPurple)
    .cornerRadius(8)
    .shadow(color: .systemPurple, radius: 8, offset: CGSize(width: 0, height: 4), opacity: 0.4)

// Remove shadow
view.removeShadow()
```

#### Debounced Actions
```swift
// Default 0.3s delay
button.debouncedAction {
    print("Action executed!")
}

// Custom delay and events
button.debouncedAction(delay: 1.0, for: .touchUpInside) {
    print("Custom debounced action!")
}

// TextField debouncing
textField.debouncedAction(delay: 0.5, for: .editingChanged) {
    performSearch()
}
```

#### Text Input Controls
```swift
// TextField with SwiftUI-style modifiers
UITextField()
    .keyboardType(.emailAddress)
    .textFieldStyle(.roundedRect)
    .autocorrectionDisabled()
    .textContentType(.emailAddress)
    .submitLabel(.done)
    .secureField(false)

// TextEditor with SwiftUI-style modifiers  
UITextView()
    .keyboardType(.default)
    .textInputAutocapitalization(.sentences)
    .textEditorScrollable(true)
    .textEditorEditable(true)
    .scrollContentBackground(true)

// Segmented Control with SwiftUI-style modifiers
UISegmentedControl(items: ["Option 1", "Option 2", "Option 3"])
    .selection(0)
    .selectedSegmentTintColor(.systemBlue)
    .pickerEnabled(true)
    .onSelectionChange { index in
        print("Selected: \(index)")
    }
```

#### Important: Layer Frame Updates

When using borders or gradients with HypeUI, ensure proper layer sizing by calling `updateHypeUILayers()` in your view's `layoutSubviews`:

```swift
class MyCustomView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateHypeUILayers() // Updates border and gradient layer frames
    }
}

// Or in ViewBuildable components:
struct MyViewBuildable: ViewBuildable {
    func build() -> UIView {
        let containerView = UIView()
        
        // Apply borders and gradients
        containerView
            .gradient(colors: [.red, .blue])
            .border(edges: .all, color: .black, width: 2)
        
        // Container will automatically update layers when bounds change
        return containerView
    }
}
```

## Main Contributors
cruz@hpcnt.com
xeon@hpcnt.com
owen.j@hpcnt.com
dough@hpcnt.com
## Dependencies

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [RxCocoa](https://github.com/ReactiveX/RxSwift/tree/main/RxCocoa)
- [SnapKit](https://github.com/SnapKit/SnapKit)
