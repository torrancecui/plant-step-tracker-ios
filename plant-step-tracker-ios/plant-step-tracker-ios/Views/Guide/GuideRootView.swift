//
//  GuideRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/28/23.
//

import SwiftUI

struct GuideRootView: View {
    @State private var currentTab = 0
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            GuideIntroductionView().padding(ONBOARDING_GUIDE_PADDING)
                .tag(0)
            GuideInstructionsView().padding(ONBOARDING_GUIDE_PADDING)
                .tag(1)
            GuideGetStartedView().padding(ONBOARDING_GUIDE_PADDING)
                .tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct GuideRootView_Previews: PreviewProvider {
    static var previews: some View {
        GuideRootView()
    }
}
