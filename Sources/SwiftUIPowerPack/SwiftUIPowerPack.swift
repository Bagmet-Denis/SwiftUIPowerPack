import SwiftUI

public struct HapticButton<Content: View>: View{
    public let action: () -> Void
    public let content: () -> Content
    
    public var body: some View{
        Button(action: {
            Haptics.shared.play(.soft)
            action()
        }, label: content)
        .buttonStyle(.plain)
        
    }
}
