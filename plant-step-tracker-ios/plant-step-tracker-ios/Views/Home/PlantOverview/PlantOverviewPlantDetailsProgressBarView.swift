//
//  PlantOverviewPlantDetailsProgressBarView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/27/23.
//

import SwiftUI

struct PlantOverviewPlantDetailsProgressBarView: View {
    @EnvironmentObject var plantLibraryModel: PlantLibraryModel
    var ownedPlant: OwnedPlant
    
    //TODO: get current steps
    var currentSteps = 500;
    
    var body: some View {
        VStack{
            Text("\(ownedPlant.getDailyStepsToWater(plantLibraryModel: plantLibraryModel) - currentSteps)").bold()
            Text("Steps remaining").font(.footnote)
            HStack{
                ProgressView(value: Float(currentSteps) / Float(ownedPlant.getDailyStepsToWater(plantLibraryModel: plantLibraryModel)))
                Spacer()
                Image(systemName: "drop")
                    .fontWeight(.bold)
                    .foregroundColor(ownedPlant.isWatered ? .blue : .gray)
            }
            
        }.padding(PROGRESS_BAR_PADDING)
    }
}
