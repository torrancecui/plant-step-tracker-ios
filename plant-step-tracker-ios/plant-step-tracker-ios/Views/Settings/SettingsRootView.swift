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
            ZStack{
                HStack{
                    Button(action: {
                        withAnimation {
                            showSettingsView = false
                        }
                    }) {
                        Image(systemName: "chevron.backward")
                            .imageScale(.large)
                    }
                    Spacer()
                }
                HStack{
                    Text("Settings").bold()
                }
            }.padding(HEADER_PADDING)
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
        }
        
    }
}
