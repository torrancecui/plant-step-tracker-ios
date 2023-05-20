//
//  HomeHeaderView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var showPlantLibraryView: Bool
    @Binding var showSettingsView: Bool
    var body: some View {
        HStack{
            Button(action: {
                withAnimation{
                    showPlantLibraryView = true
                }
            }, label: {
                Image(systemName: "book.closed")
            })
            Spacer()
            BrandLogoView()
            Spacer()
            Button(action: {
                withAnimation{
                    showSettingsView = true
                }
            }, label: {
                Image(systemName: "gearshape.2")
            })
        }.padding(10)
    }
}
