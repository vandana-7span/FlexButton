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
- `gradientColors: [Color]?` - Optional gradient colors for the button background. Defaults to a solid background color.
- `icon: Image?` - Optional image to be displayed as an icon.
- `title: String` - The button's text.
- `borderColor: Color?` - Optional border color. Defaults to `nil`.
- `borderWidth: CGFloat` - The width of the button's border. Defaults to `0`.
- `cornerRadius: CGFloat` - The corner radius of the button. Defaults to `0`.
- `shadowColor: Color?` - Optional shadow color. Defaults to `nil`.
- `shadowRadius: CGFloat` - The radius of the shadow effect. Defaults to `5`.
- `shadowOffset: CGSize` - The offset of the shadow effect. Defaults to `CGSize(width: 0, height: 0)`.
- `shadowOpacity: Double` - The opacity of the shadow. Defaults to `0.5`.
- `isLoadingState: Binding<Bool>` - A binding to determine whether the button is in a loading state.
- `loadingColor: Color` - The color of the loading indicator. Defaults to `white`.
- `font: Font` - The font used for the title text. Defaults to `system(size: 16, weight: .bold, design: .rounded)`.
- `titleColor: Color` - The color of the title text. Defaults to `white`.
- `backgroundColor: Color` - The solid background color. Defaults to `red`.
- `titlePosition: CGPoint` - The position of the title text inside the button. Defaults to `(0,0)`.
- `iconPosition: CGPoint` - The position of the icon inside the button. Defaults to `(0,0)`.
- `iconColor: Color` - The color of the icon. Defaults to `white`.
- `buttonWidth: CGFloat?` - The width of the button. Defaults to `nil` (stretches to available width).
- `buttonHeight: CGFloat?` - The height of the button. Defaults to `nil` (default is 50).
- `action: (Bool) -> Void` - The function to execute when the button is tapped. The `Bool` parameter indicates whether the button is in a loading state.


### Code
```swift
import SwiftUI
import FlexButton 

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        FlexiButton(
            gradientColors: [Color.blue, Color.purple],
            icon: Image(systemName: "star.fill"),
            title: "Click Me",
            borderColor: .white,
            borderWidth: 2,
            cornerRadius: 10,
            shadowColor: .gray,
            shadowRadius: 5,
            shadowOffset: CGSize(width: 2, height: 2),
            shadowOpacity: 0.3,
            isLoadingState: $isLoading,
            loadingColor: .white,
            titleColor: .white,
            backgroundColor: .blue,
            iconColor: .yellow,
            buttonWidth: 200,
            buttonHeight: 50,
            action: { _ in
                isLoading.toggle()
            }
        )
    }
}



Author

Vandana Modi, vandana@7span.com

