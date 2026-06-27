import SwiftUI
import AppKit

/// Sets the window background color to match the sidebar surface,
/// eliminating the system title bar chrome strip without breaking
/// the sidebar's native rounded-corner styling.
///
/// Usage:
///   .background(TitleBarAccessor())
struct TitleBarAccessor: NSViewRepresentable {
    let color: NSColor

    init(_ color: NSColor = NSColor(red: 0.078, green: 0.086, blue: 0.118, alpha: 1.0)) {
        self.color = color
    }

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            view.window?.backgroundColor = color
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
