//
//  PlantLibraryModel.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/20/23.
//

import Foundation
import Firebase

class PlantLibraryModel: ObservableObject {
    @Published var plantLibrary = [String:Plant]()
    
    func fetchPlantLibrary() {
        Firestore.firestore().collection("PLANTS_LIBRARY").getDocuments { query, error in
            if (error == nil) {
                if let query = query {
                    DispatchQueue.main.async {
                        for doc in query.documents {
                            self.plantLibrary[doc.documentID] = Plant(
                                id: doc.documentID,
                                speciesName: doc["SPECIES_NAME"] as? String ?? "",
                                dailyStepsToWater: doc["DAILY_STEPS_TO_WATER"] as? Int ?? -1,
                                totalStepsToUnlock: doc["TOTAL_STEPS_TO_UNLOCK"] as? Int ?? -1
                            )
                        }
                    }
                }
            } else {
                print("Error fetching plant library.")
            }
            
        }
    }
}

