// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

public enum ImageAlignment {
    case left, right, top, bottom
}

@available(macOS 10.15, *)
public struct FlexButton: View {
    // Properties
    public var gradientColors: [Color]?
    public var icon: Image?
    public var title: String
    public var borderColor: Color?
    public var borderWidth: CGFloat = 0
    public var cornerRadius: CGFloat = 10
    public var shadowColor: Color?
    public var shadowRadius: CGFloat = 5
    public var shadowOffset: CGSize = CGSize(width: 0, height: 2)
    public var shadowOpacity: Double = 0.5
    @Binding public var isLoadingState: Bool
    public var loadingColor: Color = .white
    public var imageAlignment: ImageAlignment = .left
    public var imageTitleSpacing: CGFloat = 8
    public var buttonWidth: CGFloat? = nil
    public var buttonHeight: CGFloat? = nil
    public var font: Font = .system(size: 16, weight: .bold, design: .rounded)
    public var titleColor: Color = .white
    public var backgroundColor: Color = .blue
    public var wrapButton: Bool = false
    public var action: (Bool) -> Void  // Updated action to accept a loading state

    public init(
        gradientColors: [Color]? = nil,
        icon: Image? = nil,
        title: String = "",
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 10,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat = 5,
        shadowOffset: CGSize = CGSize(width: 0, height: 2),
        shadowOpacity: Double = 0.5,
        isLoadingState: Binding<Bool>,
        loadingColor: Color = .white,
        imageAlignment: ImageAlignment = .left,
        imageTitleSpacing: CGFloat = 8,
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        font: Font = .system(size: 16, weight: .bold, design: .rounded),
        titleColor: Color = .white,
        backgroundColor: Color = .blue,
        wrapButton: Bool = false,
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
        self._isLoadingState = isLoadingState
        self.loadingColor = loadingColor
        self.imageAlignment = imageAlignment
        self.imageTitleSpacing = imageTitleSpacing
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.font = font
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.wrapButton = wrapButton
        self.action = action
    }

    public var body: some View {
        ZStack {
            Button(action: {
                action(isLoadingState)  // Start loading from the outside function
            }) {
                Text(isLoadingState ? "" : title)
                    .font(font)
                    .foregroundColor(titleColor)
                    .frame(
                        width: isLoadingState ? 60 : (buttonWidth ?? 200),
                        height: isLoadingState ? 60 : (buttonHeight ?? 50)
                    )
                    .background(backgroundView)
                    .clipShape(
                        isLoadingState
                            ? RoundedRectangle(cornerRadius: 30)
                            : RoundedRectangle(cornerRadius: cornerRadius)
                    )
                    .overlay(borderOverlay)
                    .shadow(
                        color: shadowColor?.opacity(shadowOpacity) ?? .clear,
                        radius: shadowRadius,
                        x: shadowOffset.width,
                        y: shadowOffset.height
                    )
            }

            if isLoadingState {
                CircularProgressView(color: loadingColor)
                    .opacity(isLoadingState ? 1 : 0)
                    .scaleEffect(isLoadingState ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isLoadingState)
            }
        }
    }

    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(gradientBackground)
    }

    private var gradientBackground: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: gradientColors ?? [backgroundColor]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(borderColor ?? .clear, lineWidth: borderWidth)
    }
}

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
