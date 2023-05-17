//
//  LoginRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI
import FirebaseAuth

struct LoginRootView: View {
    @Binding var currentAuthView: String
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
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
            
            Button(action: {
                withAnimation {
                    self.currentAuthView = "CREATE_ACCOUNT"
                }
            }) {
                Text("Don't have an account?")
            }

            Button(action: {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let authResult = authResult {
                        print(authResult.user.uid)
                        withAnimation {
                            userID = authResult.user.uid
                        }
                    }
                }
            }) {
                Text("Sign in")
            }
        }
    }
}
