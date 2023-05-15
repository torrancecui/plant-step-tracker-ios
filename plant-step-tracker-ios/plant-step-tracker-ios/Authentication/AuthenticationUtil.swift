//
//  AuthenticationUtil.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import Foundation

func isValidPassword(_ password: String) -> Bool {
    
    // minimum 6 characters long
    // 1 uppercase character
    // 1 special char
    
    let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
    
    return passwordRegex.evaluate(with: password)
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}
