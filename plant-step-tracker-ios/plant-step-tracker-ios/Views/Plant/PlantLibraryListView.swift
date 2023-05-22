//
//  PlantLibraryListView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryListView: View {
    @ObservedObject var plantLibraryModel = PlantLibraryModel()
    var body: some View {
        List(plantLibraryModel.plantLibrary){ plant in
            PlantLibraryEntryView(plant: plant)
        }
    }
    init(){
        plantLibraryModel.fetchPlantLibrary()
    }
}

struct PlantLibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantLibraryListView()
    }
}
