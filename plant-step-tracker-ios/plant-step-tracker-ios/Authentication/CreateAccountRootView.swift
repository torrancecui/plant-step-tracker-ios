//
//  CreateAccountRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountRootView: View {
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
                if ( email.count != 0) {
                    Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                        .fontWeight(.bold)
                        .foregroundColor(email.isValidEmail() ? .green : .red)
                }
            }.applyAuthTextFieldTheme()
            
            HStack {
                Image(systemName: "lock")
                SecureField("Password", text: $password).autocapitalization(.none)
                Spacer()
                if(password.count != 0) {
                    Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword(password) ? .green : .red)
                }
            }.applyAuthTextFieldTheme()
            
            Button(action: {
                withAnimation {
                    self.currentAuthView = "LOGIN"
                }
            }) {
                Text("Already have an account?")
            }
            
            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let authResult = authResult {
                        print(authResult.user.uid)
                        userID = authResult.user.uid
                    }
                }
            }) {
                Text("Create acount")
            }
        }
    }
    
}
