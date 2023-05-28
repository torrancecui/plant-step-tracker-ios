//
//  AuthTextfieldStyle.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//
    
import SwiftUI

extension HStack {
    func applyAuthTextFieldTheme() -> some View {
        self.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.black)
                
            )
            .padding()
    }
}
