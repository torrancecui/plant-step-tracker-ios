//
//  SplashRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct SplashRootView: View {
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    BrandLogoView()
                    NavigationLink(destination: LoginRootView()) {
                        Text("Sign in")
                    }
                    NavigationLink(destination: CreateAccountRootView()) {
                        Text("Create account")
                    }
                }
            }.navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct SplashRootView_Previews: PreviewProvider {
    static var previews: some View {
        SplashRootView()
    }
}
