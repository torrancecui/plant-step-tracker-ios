//
//  OwnedPlantModel.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/22/23.
//

import Foundation
import Firebase

class OwnedPlant: Identifiable, ObservableObject {
    @Published var id: String = ""
    private var ownerID: String = ""
    // maps to doc ID of species in Plant Library
    @Published var speciesID: String = ""
    @Published var nickname: String = ""
    @Published var isWatered: Bool = false
    
    init(id: String, ownerID: String, speciesID: String, nickname: String, isWatered: Bool) {
        self.id = id
        self.ownerID = ownerID
        self.speciesID = speciesID
        self.nickname = nickname
        self.isWatered = isWatered
    }
    
    func setNickname(newNickname: String) -> Void {
        DispatchQueue.main.async {
            self.nickname = newNickname
            Firestore.firestore().collection("USERS").document(self.ownerID).collection("OWNED_PLANTS")
                .document(self.id).updateData(["NICKNAME": newNickname]) { error in
                    if let error = error {
                        print("Error updating nickname: \(error)")
                    }else{
                        print("Nickname updated.")
                    }
                }
        }
    }
    
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
