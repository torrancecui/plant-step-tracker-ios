//
//  PlantLibraryEntryView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryEntryView: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .leading){
            Text(plant.speciesName).bold()
            Text("Steps to water: \(plant.dailyStepsToWater)")
            Text("Total steps to unlock: \(plant.totalStepsToUnlock)")
        }
    }
}
