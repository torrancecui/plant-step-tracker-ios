//
//  HomeStepInfoBarView.swift
//  plant-step-tracker-ios
//
//  Created by Torrance Cui on 5/19/23.
//

import SwiftUI

struct HomeStepInfoBarView: View {
    @EnvironmentObject var userContext: UserContext
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "shoeprints.fill")
                .imageScale(.large)
            VStack{
                Text("Today").bold()
                Text("\(userContext.totalStepsDay)")
            }
            Spacer()
            Image(systemName: "figure.walk.circle")
                .imageScale(.large)
            VStack{
                Text("Total").bold()
                Text("\(userContext.totalStepsLifetime)")
            }
            Spacer()
        }
    }
}
