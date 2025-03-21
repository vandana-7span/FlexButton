// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A customizable button with gradient, shadow, icon, and loading state.
@available(macOS 10.15, *)
public struct FlexButton: View {
    // Customization Properties
    public var gradientColors: [Color]?
    public var icon: Image?
    public var title: String?
    public var borderColor: Color?
    public var borderWidth: CGFloat
    public var cornerRadius: CGFloat
    public var shadowColor: Color?
    public var shadowRadius: CGFloat
    public var shadowOffset: CGSize
    public var shadowOpacity: Double
    public var font: Font
    public var titleColor: Color
    public var backgroundColor: Color
    public var titlePosition: CGPoint
    public var iconPosition: CGPoint
    public var iconColor: Color
    
    // Loading State
    @Binding public var isLoadingState: Bool
    public var loadingColor: Color
    
    // Button Size
    public var buttonWidth: CGFloat?
    public var buttonHeight: CGFloat?
    
    // Action Handler
    public var action: (Bool) -> Void
    
    // Public initializer
    public init(
        gradientColors: [Color]? = nil,
        icon: Image? = nil,
        title: String? = nil,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 0,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat = 5,
        shadowOffset: CGSize = CGSize(width: 0, height: 0),
        shadowOpacity: Double = 0.5,
        font: Font = .system(size: 16, weight: .bold, design: .rounded),
        titleColor: Color = .white,
        backgroundColor: Color = .red,
        titlePosition: CGPoint = CGPoint(x: 170, y: 25),
        iconPosition: CGPoint = CGPoint(x: -170, y: 25),
        iconColor: Color = .white,
        isLoadingState: Binding<Bool>,
        loadingColor: Color = .white,
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        action: @escaping (Bool) -> Void
    ) {
        self.gradientColors = gradientColors
        self.icon = icon
        self.title = title
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.font = font
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.titlePosition = titlePosition
        self.iconPosition = iconPosition
        self.iconColor = iconColor
        self._isLoadingState = isLoadingState
        self.loadingColor = loadingColor
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button(action: {
                action(isLoadingState)
            }) {
                if !isLoadingState {
                    buttonContent
                } else {
                    Color.clear.frame(width: buttonWidth ?? 60, height: buttonHeight ?? 50) // Placeholder to maintain layout
                }
            }
            .frame(maxWidth: isLoadingState ? 60 : (buttonWidth ?? .infinity))
            .frame(height: isLoadingState ? 60 : (buttonHeight ?? 50))
            .background(backgroundView)
            .clipShape(RoundedRectangle(cornerRadius: isLoadingState ? 30 : cornerRadius))
            .overlay(borderOverlay)
            .shadow(
                color: shadowColor?.opacity(shadowOpacity) ?? .clear,
                radius: shadowRadius,
                x: shadowOffset.width,
                y: shadowOffset.height
            )
            
            if isLoadingState {
                CircularProgressView(color: loadingColor)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.3), value: isLoadingState)
            }
        }
    }
    
    /// The button's content including title and icon.
    private var buttonContent: some View {
        ZStack {
            if let title = title {
                Text(title)
                    .position(titlePosition)
                    .font(font)
                    .foregroundColor(titleColor)
            }
            iconView
                .position(iconPosition)
        }
    }
    
    /// The button's icon with applied color and visibility settings.
    private var iconView: some View {
        icon?
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundColor(iconColor) // Apply color
            .opacity(icon == nil ? 0 : 1) // Ensures layout doesn’t collapse
    }
    
    /// The button's background with gradient support.
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(gradientBackground)
    }
    
    /// Gradient background for the button.
    private var gradientBackground: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: gradientColors ?? [backgroundColor]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    /// Border overlay with configurable color and width.
    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(borderColor ?? .clear, lineWidth: borderWidth)
    }
}

/// A circular progress indicator for loading state.
@available(macOS 10.15, *)
struct CircularProgressView: View {
    @State private var rotation = 0.0
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: 0.08, to: 1.0)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(.degrees(rotation))
            .frame(width: 40, height: 40)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotation = 360.0
                }
            }
    }
}
