//
//  HomePlantOverviewEntryView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/23/23.
//

import SwiftUI

struct HomePlantOverviewEntryView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    var ownedPlant: OwnedPlant
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(ownedPlant.nickname).bold()
                Spacer()
                Image(systemName: "leaf")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Spacer()
                Text(plantLibraryModel.plantLibrary[ownedPlant.speciesID]?.speciesName ?? "").italic()
            }
            Spacer()
            Image(systemName: "drop")
                .fontWeight(.bold)
                .foregroundColor(ownedPlant.isWatered ? .blue : .gray)
        }
        
    }
}
