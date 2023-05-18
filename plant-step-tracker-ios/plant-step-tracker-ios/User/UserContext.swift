//
//  UserContext.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/17/23.
//

import Foundation
import FirebaseAuth

class UserContext: NSObject, ObservableObject {
    @Published var userID: String = ""
    @Published var isSignedIn: Bool = false
    
    override init() {
        super.init()
        if Auth.auth().currentUser != nil {
            isSignedIn = true
        }
    }
}
