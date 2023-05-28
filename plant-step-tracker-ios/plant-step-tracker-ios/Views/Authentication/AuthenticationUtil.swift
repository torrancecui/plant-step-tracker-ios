//
//  AuthenticationUtil.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import Foundation
import Firebase

func isValidPassword(_ password: String) -> Bool {
    
    // TODO
    // minimum 6 characters long
    // 1 uppercase character
    // 1 special char
    
    // let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
    // return passwordRegex.evaluate(with: password)
    
    return password.count >= 6
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}

func createNewUser(userID: String) -> Void {
    let newUserData: [String: Any] = [
        "SHOW_ONBOARDING_FLOW": true,
        "TOTAL_STEPS_DAY": 0,
        "TOTAL_STEPS_LIFETIME": 0,
    ]
    Firestore.firestore().collection("USERS").document(userID).setData(newUserData) { error in
        if let error = error {
            print("Error creating new user: \(error)")
        } else {
            print("New user successfully written.")
        }
    }
    
    //TODO: implement first plant species logic here
    let firstPlantSpeciesID: String  = "cEcaDVvoApwmTh1cc4ci"
    
    let firstPlantData: [String: Any] = [
        "IS_WATERED": false,
        "NICKNAME": "First Plant",
        "SPECIES_ID": firstPlantSpeciesID,
    ]
    Firestore.firestore().collection("USERS").document(userID)
        .collection("OWNED_PLANTS").document().setData(firstPlantData){ error in
            if let error = error {
                print("Error adding plant collection: \(error)")
            } else {
                print("New plant collection added.")
            }
        }
}
