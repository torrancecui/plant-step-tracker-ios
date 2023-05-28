//
//  AuthButtonStyle.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/28/23.
//

import SwiftUI

public struct AuthButtonStyle: ButtonStyle {
    
    public var isCreateAccount: Bool = false
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(AUTH_BUTTON_PADDING)
            .background(isCreateAccount ? SECONDARY_ACCENT_COLOR : PRIMARY_ACCENT_COLOR)
            .foregroundColor(.black)
            .clipShape(Capsule())
    }
}
