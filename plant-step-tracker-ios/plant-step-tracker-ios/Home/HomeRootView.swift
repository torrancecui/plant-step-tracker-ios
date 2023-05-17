//
//  HomeRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct HomeRootView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        if userID == "" {
            AuthenticationRootView()
        } else {
            Text("Logged in! This is the HomeRootView")
        }
        
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
