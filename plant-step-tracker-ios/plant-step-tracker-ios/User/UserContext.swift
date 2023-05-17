//
//  UserContext.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/17/23.
//

import Foundation

class UserContext: ObservableObject {
    @Published var userID: String = ""
    @Published var isSignedIn: Bool = false
}
