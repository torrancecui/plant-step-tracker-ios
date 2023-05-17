//
//  UserContext.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/17/23.
//

import Foundation

class UserContext: ObservableObject {
    // testing personal access token
    @Published var userID: String = ""
    @Published var isSignedIn: Bool = false
}
