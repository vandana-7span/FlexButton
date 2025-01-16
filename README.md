# FlexButton
FlexButton is a flexible and customizable button component for iOS applications, built using Swift. It provides a variety of styling options, animations, and interaction patterns, making it easy to integrate into different types of user interfaces.

To run the example project, Add Package https://github.com/vandana-7span/FlexButton/tree/main

Requirements

iOS 13.0+
Installation




The FlexButton allows for extensive customization including:

Gradient colors
Icon support
Shadow effects
Loading state management
Customizable font and title properties
Here is a simple example:


import FlexiButton

FlexButton(
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

