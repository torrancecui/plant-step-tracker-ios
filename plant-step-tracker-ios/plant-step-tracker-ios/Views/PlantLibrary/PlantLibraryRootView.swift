//
//  PlantLibraryRootView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct PlantLibraryRootView: View {
    @Binding var showPlantLibraryView: Bool
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button(action: {
                        withAnimation {
                            showPlantLibraryView = false
                        }
                    }) {
                        Image(systemName: "chevron.backward")
                            .imageScale(.large)
                    }.foregroundColor(.black)
                    Spacer()
                }
                HStack{
                    Text("Plant Library").bold()
                }
            }.padding(HEADER_PADDING)
            PlantLibraryListView()
        }
    }
}
