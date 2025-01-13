# FlexButton
FlexButton is a flexible and customizable button component for iOS applications, built using Swift. It provides a variety of styling options, animations, and interaction patterns, making it easy to integrate into different types of user interfaces.

To run the example project, clone the repo, and run pod install from the Example directory first.

Requirements

iOS 13.0+
Installation

FlexiButton is available through CocoaPods. To install it, simply add the following line to your Podfile:

pod 'FlexiButton'
Usage

The FlexiButton allows for extensive customization including:

Gradient colors
Icon support
Shadow effects
Loading state management
Customizable font and title properties
Here is a simple example:


import FlexiButton

FlexiButton(
                gradientColors: [Color.green, Color.yellow],
                icon: Image(systemName: "star.fill"),
                title: "Press Me",
                borderColor: .blue,
                borderWidth:2,
                cornerRadius: 35,
                isLoadingState: $isLoadingPress,
                loadingColor : .red,
                buttonWidth: 200,
                buttonHeight: 50,
                wrapButton: true,
                action: {_ in 
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isLoadingPress = true  // Start loading
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isLoadingPress = false  // Stop loading
                        }
                    }
                }
            )



Author

Vandana, vandana@7span.com
