//
//  ScarfTheme.swift
//  Scarf Design System — Swift token bridge
//
//  Mirrors colors_and_type.css. All colors resolve from ScarfBrand.xcassets,
//  so light/dark variants come from the asset catalog automatically.
//
//  Usage:
//    Text("Hello").foregroundStyle(ScarfColor.foregroundPrimary)
//    RoundedRectangle(cornerRadius: ScarfRadius.lg)
//        .fill(ScarfColor.backgroundSecondary)
//        .overlay(RoundedRectangle(cornerRadius: ScarfRadius.lg)
//            .strokeBorder(ScarfColor.border, lineWidth: 1))
//
//  Drop-in: add this file + ScarfBrand.xcassets to your target. Nothing else.
//

import SwiftUI

// MARK: - Colors

/// All Scarf brand colors. Resolves from ScarfBrand.xcassets (light + dark).
public enum ScarfColor {
    fileprivate static func asset(_ name: String) -> Color {
        Color(name, bundle: .module)
    }

    // Brand
    // Brand — Claude Official Indigo
    public static let brandRust         = Color(red: 0.388, green: 0.400, blue: 0.945)       // #6366f1
    public static let brandRustHover    = Color(red: 0.506, green: 0.541, blue: 0.973)       // #818cf8
    public static let brandRustActive   = Color(red: 0.310, green: 0.275, blue: 0.898)       // #4f46e5
    public static let brandAmber        = Color(red: 0.604, green: 0.698, blue: 0.953)       // #9ab2f3 — lighter indigo
    public static let brandRustDeep     = Color(red: 0.192, green: 0.180, blue: 0.506)       // #312e81

    /// Semantic alias: the "primary" accent. Use this in component code,
    /// not `brandRust` directly — it lets you re-skin without a refactor.
    public static var accent: Color        { brandRust }          // #6366f1
    public static var accentHover: Color   { brandRustHover }     // #818cf8
    public static var accentActive: Color  { brandRustActive }    // #4f46e5

    /// Tinted accent for hover halos, selection backgrounds.
    public static var accentTint: Color { brandRust.opacity(0.10) }
    public static var accentTintStrong: Color { brandRust.opacity(0.18) }

    // Surfaces
    public static let backgroundPrimary   = Color(red: 0.039, green: 0.055, blue: 0.102)   // #0a0e1a — deep navy
    public static let backgroundSecondary = Color(red: 0.067, green: 0.094, blue: 0.165)   // #11182a
    public static let backgroundTertiary  = Color(red: 0.051, green: 0.071, blue: 0.125)   // #0d1220

    /// Use at low alpha (0.04–0.10) for subtle fills/dividers.
    public static var border: Color       { asset("Surface/Border").opacity(0.08) }
    public static var borderStrong: Color { asset("Surface/BorderStrong").opacity(0.14) }

    // Foreground
    public static let foregroundPrimary = Color(red: 0.902, green: 0.918, blue: 0.949)   // #e6eaf2
    public static let foregroundMuted   = Color(red: 0.604, green: 0.647, blue: 0.741)   // #9aa5bd
    public static let foregroundFaint   = Color(red: 0.416, green: 0.478, blue: 0.573)   // #6a7a92
    public static let onAccent          = Color.white                                      // #ffffff

    // Semantic
    public static let success = Color(red: 0.133, green: 0.773, blue: 0.369)   // #22c55e
    public static let danger  = Color(red: 0.937, green: 0.267, blue: 0.267)   // #ef4444
    public static let warning = Color(red: 0.961, green: 0.620, blue: 0.043)   // #f59e0b
    public static let info    = Color(red: 0.349, green: 0.596, blue: 0.859)   // #5998db

    // Tool kinds (chat message decorations)
    public enum Tool {
        public static let bash   = ScarfColor.asset("Tool/ToolBash")
        public static let edit   = ScarfColor.asset("Tool/ToolEdit")
        public static let search = ScarfColor.asset("Tool/ToolSearch")
        public static let web    = ScarfColor.asset("Tool/ToolWeb")
        public static let think  = ScarfColor.asset("Tool/ToolThink")
    }
}

// MARK: - Gradients

public enum ScarfGradient {
    /// Tri-stop indigo → purple → deep indigo. Used on app icon, hero buttons, brand splashes.
    public static let brand = LinearGradient(
        colors: [
            Color(red: 0.506, green: 0.541, blue: 0.973), // #818cf8
            Color(red: 0.388, green: 0.400, blue: 0.945), // #6366f1
            Color(red: 0.310, green: 0.275, blue: 0.898)  // #4f46e5
        ],
        startPoint: .topLeading,
        endPoint:   .bottomTrailing
    )

    /// Soft indigo wash for empty states, onboarding moments.
    public static let brandSoft = LinearGradient(
        colors: [
            Color(red: 0.573, green: 0.608, blue: 0.906), // #929be7
            Color(red: 0.443, green: 0.475, blue: 0.851)  // #717ad9
        ],
        startPoint: .topLeading,
        endPoint:   .bottomTrailing
    )
}

// MARK: - Radii / spacing / shadow

public enum ScarfRadius {
    public static let sm:   CGFloat = 4
    public static let md:   CGFloat = 6
    public static let lg:   CGFloat = 8
    public static let xl:   CGFloat = 12
    public static let xxl:  CGFloat = 14
    public static let pill: CGFloat = 999
}

public enum ScarfSpace {
    public static let s1:  CGFloat = 4
    public static let s2:  CGFloat = 8
    public static let s3:  CGFloat = 12
    public static let s4:  CGFloat = 16
    public static let s5:  CGFloat = 20
    public static let s6:  CGFloat = 24
    public static let s8:  CGFloat = 32
    public static let s10: CGFloat = 40
}

public struct ScarfShadow {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public static let sm = ScarfShadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    public static let md = ScarfShadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 4)
    public static let lg = ScarfShadow(color: .black.opacity(0.10), radius: 24, x: 0, y: 8)
    public static let xl = ScarfShadow(color: .black.opacity(0.14), radius: 40, x: 0, y: 16)
}

public extension View {
    func scarfShadow(_ s: ScarfShadow) -> some View {
        self.shadow(color: s.color, radius: s.radius, x: s.x, y: s.y)
    }
}

// MARK: - Motion

public enum ScarfDuration {
    public static let fast: Double = 0.12
    public static let base: Double = 0.20
    public static let slow: Double = 0.30
}

public enum ScarfAnimation {
    /// "Smooth" spring matching the cubic-bezier(0.32, 0.72, 0, 1) easing in CSS.
    public static let smooth = Animation.spring(response: 0.35, dampingFraction: 0.85)
    public static let fast   = Animation.easeOut(duration: ScarfDuration.fast)
    public static let base   = Animation.easeOut(duration: ScarfDuration.base)
}
