// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A customizable button with gradient, shadow, icon, and loading state.
struct FlexiButton: View {
    // Customization Properties
    public var gradientColors: [Color]?
    public var icon: Image?
    public var title: String
    public var borderColor: Color?
    public var borderWidth: CGFloat = 0
    public var cornerRadius: CGFloat = 0
    public var shadowColor: Color?
    public var shadowRadius: CGFloat = 5
    public var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    public var shadowOpacity: Double = 0.5
    public var font: Font = .system(size: 16, weight: .bold, design: .rounded)
    public var titleColor: Color = .white
    public var backgroundColor: Color = .red
    public var titlePosition: CGPoint = CGPoint(x: 0, y: 0)
    public var iconPosition: CGPoint = CGPoint(x: 0, y: 0)
    public var iconColor: Color = .white // Default icon color
    
    // Loading State
    @Binding public var isLoadingState: Bool
    public var loadingColor: Color = .white
    
    // Button Size
    public var buttonWidth: CGFloat? = nil
    public var buttonHeight: CGFloat? = nil
    
    // Action Handler
    public var action: (Bool) -> Void
    
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
            Text(title)
                .position(titlePosition)
                .font(font)
                .foregroundColor(titleColor)
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
