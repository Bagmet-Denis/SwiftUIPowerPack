//
//  File.swift
//  
//
//  Created by Денис Багмет on 06.06.2023.
//

import UIKit
import SwiftUI

class Haptics {
    static let shared = Haptics()
    
    private init() { }

    func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}

public struct HapticButton<Content: View>: View{
    let action: () -> Void
    let content: () -> Content
    
    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    
    public var body: some View{
        Button(action: {
            haptic(feedbackStyle: .soft)
            action()
        }, label: content)
        .buttonStyle(.plain)
        
    }
}

public func haptic(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle){
    Haptics.shared.play(feedbackStyle)
}
