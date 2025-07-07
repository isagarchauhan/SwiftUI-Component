//
//  ContentView.swift
//  CircleLoader
//
//  Created by Sagar Chauhan on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircleLoaderView(
                model:
                    CircleLoaderModel(
                        circleCount: 5,
                        circleSize: 30,
                        backGroundCircleRadius: 60,
                        overlapFactor: 0.8
                    )
            )
        }
        .padding()
    }
}
