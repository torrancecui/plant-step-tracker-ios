//
//  HomePlantOverviewPlantDetailsView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/27/23.
//

import SwiftUI

struct PlantOverviewPlantDetailsView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    @EnvironmentObject var ownedPlant: OwnedPlant
    @State public var plantNickname: String
    
    var body: some View {
        VStack{
            TextField(ownedPlant.nickname, text: $plantNickname).autocapitalization(.none).font(.largeTitle).bold().onSubmit {
                ownedPlant.setNickname(newNickname: plantNickname);
            }.multilineTextAlignment(.center)
            Text(ownedPlant.getSpeciesName(plantLibraryModel: plantLibraryModel)).italic()
            Spacer()
            Image(systemName: APP_LOGO_NAME).resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            Spacer()
            PlantOverviewPlantDetailsProgressBarView().padding()
        }.padding(PLANT_DETAILS_PADDING)
    }
}
