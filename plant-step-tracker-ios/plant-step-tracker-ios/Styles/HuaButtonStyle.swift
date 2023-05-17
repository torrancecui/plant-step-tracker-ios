//
//  HuaButtonStyle.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

extension Button {
    func applyHuaTheme() -> some View {
        self.padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
                
            )
            .padding(5)
            
    }
}
