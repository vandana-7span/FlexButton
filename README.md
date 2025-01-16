# FlexButton
FlexButton is a flexible and customizable button component for iOS applications, built using Swift. It provides a variety of styling options, animations, and interaction patterns, making it easy to integrate into different types of user interfaces.

To run the example project, Add Package https://github.com/vandana-7span/FlexButton/tree/main

Requirements

iOS 13.0+
Installation


![Demo GIF](https://github.com/vandana-7span/FlexButton/blob/main/FlexButton.gif)


The FlexButton allows for extensive customization including:

Gradient colors
Icon support
Shadow effects
Loading state management
Customizable font and title properties
Here is a simple example:

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

