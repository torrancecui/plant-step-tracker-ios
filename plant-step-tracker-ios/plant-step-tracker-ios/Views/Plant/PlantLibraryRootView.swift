//
//  PlantLibraryRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryRootView: View {
    @Binding var showPlantLibraryView: Bool
    var body: some View {
        VStack{
            Text("Plant Library").bold()
            Spacer()
            PlantLibraryListView()
            Spacer()
            Button(action: {
                withAnimation {
                    showPlantLibraryView = false
                }
            }) {
                Text("Back")
            }
        }
        
    }
}
