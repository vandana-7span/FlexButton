# FlexButton
FlexButton is a customizable and dynamic SwiftUI component that enables developers to create stylish and functional buttons for their iOS applications. It includes features like gradient backgrounds, loading indicators, shadows, and custom actions, making it a versatile choice for any app design.

# Features

Customizable Appearance: Easily modify colors, gradients, borders, shadows, and corner radii.

Dynamic Loading State: Built-in support for showing a loading spinner when the button is in progress.

Icon and Title Alignment: Supports left, right, top, and bottom alignment of icons relative to the title.

Responsive Design: Adjustable width, height, and wrapping support.

SwiftUI Native: Fully compatible with SwiftUI for seamless integration into your projects.


To run the example project, Add Package https://github.com/vandana-7span/FlexButton/tree/main

# Requirements

Swift 5.3+

macOS 10.15+ or iOS 13+


![Demo GIF](https://github.com/vandana-7span/FlexButton/blob/main/FlexButton.gif)


The FlexButton allows for extensive customization including:
# Properties

# Appearance

gradientColors: Array of Color for gradient backgrounds.

backgroundColor: Single Color for button background.

borderColor: Color for button border.

borderWidth: Thickness of the border.

cornerRadius: Corner radius of the button.

shadowColor: Color of the shadow.

shadowRadius: Blur radius of the shadow.

shadowOffset: Offset of the shadow.

shadowOpacity: Opacity of the shadow.

# Content

icon: Image to display alongside the title.

title: String text displayed on the button.

font: Font for the title text.

titleColor: Color of the title text.

imageAlignment: Alignment of the icon relative to the title (left, right, top, bottom).

imageTitleSpacing: Spacing between the icon and the title.

# Behavior

isLoadingState: Binding<Bool> to control the loading state.

loadingColor: Color of the loading spinner.

action: Closure to handle button tap, receives the current loading state.

# Size

buttonWidth: Width of the button.

buttonHeight: Height of the button.

wrapButton: Determines if the button should wrap its content.

### Code
```swift
import FlexButton

 FlexButton(
            gradientColors: [.yellow,.green],
                       icon: Image(systemName: "star.fill"),
                       title: "Custom Button",
                       shadowColor:.black,
                       isLoadingState: $isLoading,
                       loadingColor:.white,
                       imageAlignment: ImageAlignment.top,
                       imageTitleSpacing: 10,
                       font: Font.system(size: 20, weight: Font.Weight.medium, design: Font.Design.monospaced),
                       wrapButton: false,
                       action: {_ in
                           
                               withAnimation(.easeInOut(duration: 0.5)) {
                                   isLoading = true  // Start loading
                               }
                               DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                   withAnimation(.easeInOut(duration: 0.5)) {
                                       isLoading = false  // Stop loading
                                   }
                               }
                       }
                   )
                   .padding()



Author

Vandana Modi, vandana@7span.com

