//
//  AuthenticationRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/16/23.
//

import SwiftUI

struct AuthenticationRootView: View {
    @State private var currentAuthView: String = "LOGIN"
    var body: some View {
        if(currentAuthView == "LOGIN") {
            LoginRootView(currentAuthView: $currentAuthView)
        } else {
            CreateAccountRootView(currentAuthView: $currentAuthView)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthenticationRootView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationRootView()
    }
}
