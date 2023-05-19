//
//  SplashRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct SplashRootView: View {
    @State private var isActive: Bool = false
    var body: some View {
            ZStack {
                if self.isActive {
                    HomeRootView()
                } else {
                    BrandLogoView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

struct SplashRootView_Previews: PreviewProvider {
    static var previews: some View {
        SplashRootView()
    }
}
