//
//  LoginRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct LoginRootView: View {
    func redirectSignInView(){
        print("sign in")
    }
    var body: some View {
        VStack{
            BrandLogoView()
            Button(action: redirectSignInView) {
                Text("Sign in with Google")
            }
        }
    }
}

struct LoginRootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRootView()
    }
}
