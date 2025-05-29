//
//  ContentView.swift
//  CustomSwitch
//
//  Created by Sagar Chauhan on 28/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            CustomSwitch(
                isOn: $isOn,
                props: CustomSwitchProps(
                    onColor: .green,
                    offColor: .gray,
                    thumbColor: .white,
                    size: CGSize(width: 60, height: 34),
                    animation: .spring(response: 0.3, dampingFraction: 0.6)
                ),
                onToggle: { newValue in
                    print("Switch is : \(newValue ? "ON" : "OFF")")
                }
            )
        }
        .padding()
    }
}
