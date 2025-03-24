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
- `gradientColors: [Color]?` - Optional gradient colors for the button background. Defaults to `nil` (solid background).
- `icon: Image?` - Optional image to be displayed as an icon. Defaults to `nil`.
- `iconColor: Color` - The color of the icon. Defaults to `.white`.
- `title: String?` - Optional button text. Defaults to `nil`.
- `borderColor: Color?` - Optional border color. Defaults to `nil`.
- `borderWidth: CGFloat` - The width of the button's border. Defaults to `0`.
- `cornerRadius: CGFloat` - The corner radius of the button. Defaults to `0`.
- `shadowColor: Color?` - Optional shadow color. Defaults to `nil`.
- `shadowRadius: CGFloat` - The radius of the shadow effect. Defaults to `10`.
- `shadowOffset: CGSize` - The offset of the shadow effect. Defaults to `CGSize(width: 5, height: 5)`.
- `shadowOpacity: Double` - The opacity of the shadow. Defaults to `0.7`.
- `isLoadingState: Binding<Bool>` - A binding to determine whether the button is in a loading state.
- `loadingColor: Color` - The color of the loading indicator. Defaults to `.white`.
- `imageAlignment: ImageAlignment` - The alignment of the icon relative to the text. Defaults to `.left`.
- `buttonWidth: CGFloat?` - The width of the button. Defaults to `nil` (stretches to available width).
- `buttonHeight: CGFloat?` - The height of the button. Defaults to `nil`.
- `font: Font` - The font used for the title text. Defaults to `.system(size: 16, weight: .bold, design: .rounded)`.
- `titleColor: Color` - The color of the title text. Defaults to `.white`.
- `backgroundColor: Color` - The solid background color. Defaults to `.blue`.
- `wrapButton: Bool` - Whether the button adjusts its size dynamically to fit content. Defaults to `false`.
- `iconPadding: EdgeInsets` - Padding around the icon. Defaults to `EdgeInsets()`.
- `titlePadding: EdgeInsets` - Padding around the title. Defaults to `EdgeInsets()`.
- `action: (Bool) -> Void` - The function executed when the button is tapped. The `Bool` parameter indicates whether the button is in a loading state.


### Code
```swift
import SwiftUI
import FlexButton 

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        FlexiButton(
            // 🟢 Background & Gradient
            gradientColors: [Color.blue, Color.purple], // Use gradient colors or backgroundColor
            icon: Image(systemName: "star.fill"),
            iconColor: .yellow, // Custom color for the icon
           
            // 🔠 Text Properties
            title: "Custom Button",
            
            borderColor: .yellow, // Border color
            borderWidth: 3, // Border thickness
            cornerRadius: 15, // Rounded corners

            // 🌫 Shadow Properties
            shadowColor: .blue, // Shadow color
            shadowRadius: 10, // Shadow blur
            shadowOffset: CGSize(width: 5, height: 5), // Offset position
            shadowOpacity: 0.7, // Opacity of the shadow
            
            // ⏳ Loading State
            isLoadingState: $isLoading, // Controls loading animation
            loadingColor: .red, // Spinner color
            
            // 🔘 Icon & Alignment
            imageAlignment: .top, // Can be .left, .right, .top, .bottom

            // 🔳 Button Dimensions
            buttonWidth: .greatestFiniteMagnitude, // Set width (or use .infinity for full width)
            buttonHeight: 80, // Set height (or use .infinity for full height)
            
            font: .system(size: 18, weight: .bold, design: .rounded),
            titleColor: .white,
            
            backgroundColor: .blue, // Ignored if gradientColors are provided

            // 🔄 Wrap Button (Allows flexible width/height)
            wrapButton: false,
          

            // 🏞 Edge Insets (Padding for icon & title)
           iconPadding: EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10),
           titlePadding: EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10),
         

            // ⚡ Action Handler
            action: { _ in
                isLoading.toggle() // Toggle loading state
            }
        )
    }
}



Author

Vandana Modi, vandana@7span.com

