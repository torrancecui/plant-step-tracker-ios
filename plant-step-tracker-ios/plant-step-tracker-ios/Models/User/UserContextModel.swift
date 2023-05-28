//
//  UserContextModel.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/20/23.
//

import Foundation
import Firebase

class UserContext: NSObject, ObservableObject {
    // user info
    @Published var userID: String = ""
    @Published var isSignedIn: Bool = false
    @Published var showOnboardingFlow: Bool = false
    
    // step info
    @Published var totalStepsLifetime = -1
    @Published var totalStepsDay = -1
    
    // plant info
    @Published var ownedPlants = [OwnedPlant]()
    
    
    override init() {
        super.init()
        if Auth.auth().currentUser != nil {
            isSignedIn = true
            userID = Auth.auth().currentUser?.uid ?? ""
            self.fetchUserContext()
        }
    }
    
    public func fetchUserContext() {
        Firestore.firestore().collection("USERS").document(userID).getDocument { (document, error) in
            if (self.userID.isEmpty){
                print("User ID is empty")
                return
            }
            if (error == nil) {
                if let document = document, document.exists {
                    DispatchQueue.main.async {
                        self.totalStepsLifetime = document.get("TOTAL_STEPS_LIFETIME") as? Int ?? -1
                        self.totalStepsDay = document.get("TOTAL_STEPS_DAY") as? Int ?? -1
                        self.showOnboardingFlow = document.get("SHOW_ONBOARDING_FLOW") as? Bool ?? false
                        self.fetchOwnedPlants()
                    }
                }
                print("Fetched context for userID: \(self.userID).")
            } else {
                print("Error fetching user.")
            }
        }
    }
    
    private func fetchOwnedPlants() {
        Firestore.firestore().collection("USERS").document(userID).collection("OWNED_PLANTS").getDocuments { query, error in
            if (self.userID.isEmpty){
                print("User ID is empty")
                return
            }
            if (error == nil) {
                if let query = query {
                    self.ownedPlants = query.documents.map { doc in
                        return OwnedPlant(
                            id: doc.documentID,
                            ownerID: self.userID,
                            speciesID: doc["SPECIES_ID"] as? String ?? "",
                            nickname: doc["NICKNAME"] as? String ?? "",
                            isWatered: doc["IS_WATERED"] as? Bool ?? false
                        )
                    }
                }
                print("Fetched plants for userID: \(self.userID).")
            } else {
                print("Error fetching plants.")
            }
        }
    }
    
    public func finishOnboardingFlow() -> Void {
        self.showOnboardingFlow = false
        Firestore.firestore().collection("USERS").document(self.userID).updateData(["SHOW_ONBOARDING_FLOW": false]) { error in
            if let error = error {
                print("Error updating onboarding flow: \(error).")
            }else{
                print("Onboarding flow was finished.")
            }
        }
    }
}

