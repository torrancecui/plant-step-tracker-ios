//
//  HomePlantOverviewEntryView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/23/23.
//

import SwiftUI

struct PlantOverviewEntryView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    
    @State private var showPlantDetails = false
    var ownedPlant: OwnedPlant
    
    var body: some View {
        Button(action: {
            showPlantDetails.toggle()
        }){
            HStack{
                VStack(alignment: .leading){
                    Text(ownedPlant.nickname).bold()
                    Text(ownedPlant.getSpeciesName(plantLibraryModel: plantLibraryModel)).italic()
                }
                Spacer()
                Image(systemName: "drop")
                    .fontWeight(.bold)
                    .foregroundColor(ownedPlant.isWatered ? .blue : .gray)
            }
        }.foregroundColor(.black)
        .sheet(isPresented: $showPlantDetails) {
            PlantOverviewPlantDetailsView(ownedPlant: ownedPlant).presentationDetents([.medium])
        }
        
    }
}
