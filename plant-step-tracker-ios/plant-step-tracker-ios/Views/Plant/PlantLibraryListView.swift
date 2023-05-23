//
//  PlantLibraryListView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryListView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    var body: some View {
        List {
            ForEach(Array(plantLibraryModel.plantLibrary), id: \.key) { key, plantEntry in
                PlantLibraryEntryView(plant:plantEntry)
            }
        }
    }
}

struct PlantLibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantLibraryListView()
    }
}
