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
    
    // TODO: optimize by creating and setting member variables instead of fetching each time
    // it's a dictionary so still O(1), so does it really matter?
    
    func getSpeciesName(plantLibraryModel: PlantLibraryModel) -> String {
        return plantLibraryModel.plantLibrary[self.speciesID]?.speciesName ?? ""
    }
    
    func getDailyStepsToWater(plantLibraryModel: PlantLibraryModel) -> Int {
        return plantLibraryModel.plantLibrary[self.speciesID]?.dailyStepsToWater ?? -1
    }
    
    func getTotalStepsToUnlock(plantLibraryModel: PlantLibraryModel) -> Int {
        return plantLibraryModel.plantLibrary[self.speciesID]?.totalStepsToUnlock ?? -1
    }
}
