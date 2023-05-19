//
//  HomePlantOverviewView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/17/23.
//

import SwiftUI
import FirebaseAuth

struct HomePlantOverviewView: View {
    @EnvironmentObject var userContext: UserContext
    var body: some View {
        VStack{
            Text("Logged in! This is the HomeRootView")
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
                Text("Logout")
            }
        }
    }
}

struct HomePlantOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlantOverviewView()
    }
}
