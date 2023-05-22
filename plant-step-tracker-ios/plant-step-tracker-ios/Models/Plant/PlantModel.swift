//
//  PlantModel.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/20/23.
//

import Foundation

struct Plant: Identifiable {
    var id: String
    var speciesName: String
    var dailyStepsToWater: Int
    var totalStepsToUnlock: Int
}
