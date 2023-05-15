//
//  LoginRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct LoginRootView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView{
            VStack{
                BrandLogoView()
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email).autocapitalization(.none)
                    Spacer()
                }.applyAuthTextFieldTheme()
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password).autocapitalization(.none)
                    Spacer()
                }.applyAuthTextFieldTheme()
                
                
                Button(action: {}) {
                    Text("Sign in")
                }
            }
        }.navigationBarTitle("Sign in")
    }
}

struct LoginRootView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRootView()
    }
}
