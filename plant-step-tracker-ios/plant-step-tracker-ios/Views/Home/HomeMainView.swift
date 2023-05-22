//
//  HomeMainView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI
import FirebaseAuth

struct HomeMainView: View {
    @EnvironmentObject var userContext: UserContext
    @State var showPlantLibraryView: Bool = false
    @State var showSettingsView: Bool = false
    
    var body: some View {
        if (showPlantLibraryView){
            PlantLibraryRootView(showPlantLibraryView: $showPlantLibraryView)
        }else if (showSettingsView){
            SettingsRootView(showSettingsView: $showSettingsView)
        }else{
            VStack{
                HomeHeaderView(showPlantLibraryView: $showPlantLibraryView, showSettingsView: $showSettingsView)
                Spacer()
                HomePlantOverviewView()
                Spacer()
                HomeStepInfoBarView()
            }
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}