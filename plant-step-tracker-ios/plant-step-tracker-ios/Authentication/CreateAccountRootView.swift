//
//  CreateAccountRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct CreateAccountRootView: View {
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
                
                
                Button(action: {}) {
                    Text("Create")
                }
            }
        }.navigationBarTitle("Create account")
        
    }
}

struct CreateAccountRootView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountRootView()
    }
}
