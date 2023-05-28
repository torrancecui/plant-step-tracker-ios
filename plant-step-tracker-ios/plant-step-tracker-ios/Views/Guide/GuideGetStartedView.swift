//
//  GuideGetStartedView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/27/23.
//

import SwiftUI

struct GuideGetStartedView: View {
    @EnvironmentObject var userContext: UserContext
    var body: some View {
        VStack(alignment: .leading){
            Text("Get started!").font(.largeTitle).bold()
            Spacer()
            Image(systemName: APP_LOGO_NAME).resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Spacer()
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.")
            Spacer()
            Button(action: {
                withAnimation{
                    userContext.finishOnboardingFlow()
                }
            }){
                Text("Get started")
            }.frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}

struct GuideGetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GuideGetStartedView()
    }
}
