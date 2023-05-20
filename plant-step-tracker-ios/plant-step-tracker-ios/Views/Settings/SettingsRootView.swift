//
//  SettingsRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI
import FirebaseAuth

struct SettingsRootView: View {
    @EnvironmentObject var userContext: UserContext
    @Binding var showSettingsView: Bool
    
    var body: some View {
        VStack{
            Text("Settings").bold()
            Spacer()
            Form{
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                        withAnimation{
                            userContext.isSignedIn = false;
                        }
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }) {
                    Text("Logout").foregroundColor(Color.red)
                }
            }
            Spacer()
            Button(action: {
                withAnimation {
                    showSettingsView = false
                }
            }) {
                Text("Back")
            }
        }
        
    }
}
