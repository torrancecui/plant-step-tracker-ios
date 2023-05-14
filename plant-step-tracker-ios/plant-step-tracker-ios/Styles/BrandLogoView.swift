//
//  BrandLogoView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/14/23.
//

import SwiftUI

struct BrandLogoView: View {
    var body: some View {
        HStack{
            Image(systemName: APP_LOGO_NAME).resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(APP_NAME).font(.largeTitle)
        }
    }
}

struct BrandLogoView_Previews: PreviewProvider {
    static var previews: some View {
        BrandLogoView()
    }
}
