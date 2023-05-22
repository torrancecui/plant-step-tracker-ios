//
//  OwnedPlantModel.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/22/23.
//

import Foundation

struct OwnedPlant: Identifiable {
    var id: String
    // maps to doc ID of species in Plant Library
    var speciesID: String
    var nickname: String
    var isWatered: Bool
}
