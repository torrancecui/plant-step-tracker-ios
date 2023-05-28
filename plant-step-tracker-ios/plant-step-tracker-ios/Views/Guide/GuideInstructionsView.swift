//
//  GuideInstructionsView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/27/23.
//

import SwiftUI

struct GuideInstructionsView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("How it works").font(.largeTitle).bold()
            Spacer()
            Image(systemName: APP_LOGO_NAME).resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Spacer()
            Text("Hi welcome to app name! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.")
            Spacer()
            Text("Hi welcome to app name! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.")
            Spacer()
            Text("Hi welcome to app name! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.")
            Spacer()
        }
    }
}

struct GuideInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        GuideInstructionsView()
    }
}
