//
//  HomePlantOverviewEntryView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/23/23.
//

import SwiftUI

struct PlantOverviewEntryView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    @EnvironmentObject var ownedPlant: OwnedPlant
    
    @State private var showPlantDetails = false
    
    var body: some View {
        //TODO: make whole area tappable
        HStack{
            VStack(alignment: .leading){
                Text(ownedPlant.nickname).bold()
                Text(ownedPlant.getSpeciesName(plantLibraryModel: plantLibraryModel)).italic()
            }
            Spacer()
            Image(systemName: "drop")
                .fontWeight(.bold)
                .foregroundColor(ownedPlant.isWatered ? .blue : .gray)
        }.onTapGesture {
            showPlantDetails.toggle()
        }
        .sheet(isPresented: $showPlantDetails) {
            PlantOverviewPlantDetailsView(plantNickname: ownedPlant.nickname).presentationDetents([.medium])
        }
    }
}
