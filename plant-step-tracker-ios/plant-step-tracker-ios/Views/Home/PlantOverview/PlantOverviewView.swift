//
//  HomePlantOverviewView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/17/23.
//

import SwiftUI

struct PlantOverviewView: View {
    @EnvironmentObject var userContext: UserContext
    var body: some View {
        List(userContext.ownedPlants){ ownedPlant in
            PlantOverviewEntryView(ownedPlant: ownedPlant)
        }
    }
}
