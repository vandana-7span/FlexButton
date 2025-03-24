// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// Enum for defining the alignment of the icon within the button.
public enum ImageAlignment {
    case left, right, top, bottom
}

@available(macOS 10.15, *)
public struct FlexButton: View {
    // MARK: - Properties
    
    /// Background gradient colors for the button.
    public var gradientColors: [Color]?
    /// Icon to be displayed on the button.
    public var icon: Image?
    /// Color of the icon.
    public var iconColor: Color = .white
    /// Text to be displayed on the button.
    public var title: String?
    /// Border color of the button.
    public var borderColor: Color?
    /// Border width of the button.
    public var borderWidth: CGFloat = 0
    /// Corner radius of the button.
    public var cornerRadius: CGFloat = 0
    /// Shadow color of the button.
    public var shadowColor: Color?
    /// Shadow radius of the button.
    public var shadowRadius: CGFloat = 0
    /// Shadow offset for positioning the shadow.
    public var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    /// Opacity of the shadow.
    public var shadowOpacity: Double = 0.5
    /// Binding to control the loading state of the button.
    @Binding public var isLoadingState: Bool
    /// Color of the loading indicator.
    public var loadingColor: Color = .white
    /// Alignment of the image (icon) within the button.
    public var imageAlignment: ImageAlignment = .left
    /// Width of the button (optional).
    public var buttonWidth: CGFloat? = nil
    /// Height of the button (optional).
    public var buttonHeight: CGFloat? = nil
    /// Font for the title text.
    public var font: Font = .system(size: 16, weight: .bold, design: .rounded)
    /// Color of the title text.
    public var titleColor: Color = .white
    /// Background color of the button.
    public var backgroundColor: Color = .blue
    /// If `true`, the button wraps the loading indicator.
    public var wrapButton: Bool = false
    /// Padding around the icon.
    public var iconPadding: EdgeInsets = EdgeInsets()
    /// Padding around the title text.
    public var titlePadding: EdgeInsets = EdgeInsets()
    /// Action closure executed when the button is tapped.
    public var action: (Bool) -> Void

    // MARK: - Init
    public init(
        gradientColors: [Color]? = nil,
        icon: Image? = nil,
        iconColor: Color = .white,
        title: String? = nil,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 0,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat = 10,
        shadowOffset: CGSize = CGSize(width: 5, height: 5),
        shadowOpacity: Double = 0.7,
        isLoadingState: Binding<Bool>,
        loadingColor: Color = .white,
        imageAlignment: ImageAlignment = .left,
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        font: Font = .system(size: 16, weight: .bold, design: .rounded),
        titleColor: Color = .white,
        backgroundColor: Color = .blue,
        wrapButton: Bool = false,
        iconPadding: EdgeInsets = EdgeInsets(),
        titlePadding: EdgeInsets = EdgeInsets(),
        action: @escaping (Bool) -> Void
    ) {
        self.gradientColors = gradientColors
        self.icon = icon
        self.iconColor = iconColor
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
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.font = font
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.wrapButton = wrapButton
        self.iconPadding = iconPadding
        self.titlePadding = titlePadding
        self.action = action
    }

    // MARK: - Body
    public var body: some View {
        ZStack {
            Button(action: {
                action(isLoadingState)
            }) {
                if wrapButton && isLoadingState {
                    Color.clear
                        .frame(width: 40, height: 40) // Button wraps loader when wrapButton is true
                } else {
                    contentView
                        .frame(
                            maxWidth: buttonWidth == .infinity ? .infinity : buttonWidth,
                            maxHeight: buttonHeight == .infinity ? .infinity : buttonHeight
                        )
                }
            }
            .background(backgroundView)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(borderOverlay)
            .shadow(
                color: shadowColor?.opacity(shadowOpacity) ?? .clear,
                radius: shadowRadius,
                x: shadowOffset.width,
                y: shadowOffset.height
            )

            if isLoadingState {
                CircularProgressView(color: loadingColor)
                    .opacity(isLoadingState ? 1 : 0)
                    .scaleEffect(isLoadingState ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isLoadingState)
            }
        }
    }

    // MARK: - Views
    private var contentView: some View {
        Group {
            if icon != nil || title != nil {
                switch imageAlignment {
                case .left: HStack { iconView; textView }
                case .right: HStack { textView; iconView }
                case .top: VStack { iconView; textView }
                case .bottom: VStack { textView; iconView }
                }
            } else {
                Spacer()
            }
        }
        .padding()
    }

    private var iconView: some View {
        icon?.resizable().scaledToFit().foregroundColor(iconColor).frame(width: 24, height: 24).padding(iconPadding)
    }

    private var textView: some View {
        title.map { Text($0).font(font).foregroundColor(titleColor).padding(titlePadding) }
    }

    private var backgroundView: some View {
        (wrapButton && isLoadingState) ? AnyView(Circle().fill(gradientBackground)) : AnyView(RoundedRectangle(cornerRadius: cornerRadius).fill(gradientBackground))
    }

    private var gradientBackground: LinearGradient {
        LinearGradient(gradient: Gradient(colors: gradientColors ?? [backgroundColor]), startPoint: .leading, endPoint: .trailing)
    }

    private var borderOverlay: some View {
        (wrapButton && isLoadingState) ? AnyView(Circle().stroke(borderColor ?? .clear, lineWidth: borderWidth)) : AnyView(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor ?? .clear, lineWidth: borderWidth))
    }
}

@available(macOS 10.15, *)
struct CircularProgressView: View {
    @State private var rotation = 0.0
    var color: Color

    var body: some View {
        Circle().trim(from: 0.08, to: 1.0).stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)).foregroundColor(color).rotationEffect(.degrees(rotation)).frame(width: 40, height: 40).onAppear { withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) { rotation = 360.0 } }
    }
}
