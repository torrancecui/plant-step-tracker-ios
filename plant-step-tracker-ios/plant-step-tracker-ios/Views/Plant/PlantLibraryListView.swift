//
//  PlantLibraryListView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryListView: View {
    @ObservedObject var plantLibraryViewModel = PlantLibraryViewModel()
    var body: some View {
        List(plantLibraryViewModel.plantLibrary){ plant in
            PlantLibraryEntryView(plant: plant)
        }
    }
    init(){
        plantLibraryViewModel.fetchPlantLibrary()
    }
}

struct PlantLibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantLibraryListView()
    }
}
