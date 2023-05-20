//
//  HomeRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct HomeRootView: View {
    @StateObject var userContext = UserContext()
    
    var body: some View {
        if userContext.isSignedIn {
            HomeMainView().environmentObject(userContext)
        } else {
            AuthenticationRootView().environmentObject(userContext)
        }
        
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
