//
//  HomePlantOverviewPlantDetailsView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/27/23.
//

import SwiftUI

struct PlantOverviewPlantDetailsView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    var ownedPlant: OwnedPlant
    
    var body: some View {
        VStack{
            Text(ownedPlant.nickname).font(.largeTitle).bold()
            Text(ownedPlant.getSpeciesName(plantLibraryModel: plantLibraryModel)).italic()
            Spacer()
            Image(systemName: APP_LOGO_NAME).resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            Spacer()
            PlantOverviewPlantDetailsProgressBarView(ownedPlant: ownedPlant).padding()
        }.padding(PLANT_DETAILS_PADDING)
    }
}
