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
    @State private var authenticationError: AuthenticationError = AuthenticationError()
    @EnvironmentObject var userContext: UserContext
    
    var body: some View {
        VStack{
            Spacer()
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
            Spacer()
            Button(action: {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let loginError = error {
                        authenticationError.errorMessage = loginError.localizedDescription
                        authenticationError.showAlert = true
                        return
                    }
                    if let authResult = authResult {
                        withAnimation{
                            userContext.isSignedIn = true
                            userContext.userID = authResult.user.uid
                        }
                        print(userContext.userID)
                    }
                }
            }) {
                Text("Sign in")
            }.alert(authenticationError.errorMessage, isPresented: $authenticationError.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}
