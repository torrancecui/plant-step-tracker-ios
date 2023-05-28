//
//  HomeRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct HomeRootView: View {
    @ObservedObject var userContext = UserContext()
    @ObservedObject var plantLibraryModel = PlantLibraryModel()
    
    var body: some View {
        if userContext.isSignedIn {
            HomeMainView().environmentObject(userContext).environmentObject(plantLibraryModel)
        } else {
            AuthenticationRootView().environmentObject(userContext)
        }
    }
    init(){
       plantLibraryModel.fetchPlantLibrary()
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
