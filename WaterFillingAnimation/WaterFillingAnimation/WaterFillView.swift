//
//  WaterFillView.swift
//  WaterFillingAnimation
//
//  Created by Sagar Chauhan on 24/05/25.
//

import SwiftUI

/*
 phase: Controls the horizontal animation phase of the wave. Starts at 0 and animates continuously to 2π to make the wave move horizontally.
 fillLevel: Controls how much the water "fills" the container vertically. Ranges from 0 (empty) to 1 (full).
 
 GeometryReader:
 - Used to get the available size to make the view responsive.
 - We use the smaller dimension (min(width, height)) to keep the circle perfectly round.
 
 ZStack Container:
 Bottom alignment: To align the water at the bottom, so it fills upwards.
 
 Circle Stroke
 - Draws the outer circular border with blue color.
 
 Water and Reflection ZStack
 Wave shape:
 - Filled with a vertical blue gradient (lighter at the top, darker at the bottom).
 
 Sized to the circle diameter.
 -Offset vertically by (1 - fillLevel) * size — when fillLevel = 0, water is fully offset down (hidden); when fillLevel = 1, offset = 0 (fully visible).
 - Clipped to the circle shape, so water never overflows the circle edges.
 
 Reflection overlay:
 - A white gradient circle on the top half to simulate light reflection on the water surface.
 - Height is half the circle height.
 - Offset vertically to move up and down with the water level, creating a realistic reflection effect.
 - Also clipped to the circle to keep it confined.
 
 Animations in .onAppear
 - Wave phase animation:
 - Moves the wave horizontally, loops forever every 2 seconds with a smooth linear animation.
 
 Fill level animation:
 - Water level rises smoothly from 0 to full (1.0) in 5 seconds using an ease-in-out curve.
 
 Frame & Padding
 -Fixed 200x200 size with padding for display.
 */

struct WaterFillView: View {
    @State private var phase: CGFloat = 0
    @State private var fillLevel: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            
            ZStack(alignment: .bottom) {
                Circle()
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                    .frame(width: size, height: size)
                
                ZStack {
                    Wave(phase: phase)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.9)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: size, height: size)
                        .offset(y: (1 - fillLevel) * size)
                        .clipShape(Circle())
                    
                    // Reflection overlay on top part of circle
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                                startPoint: .top,
                                endPoint: .center
                            )
                        )
                        .frame(width: size, height: size * 0.5)
                        .offset(y: (1 - fillLevel) * size - size * 0.25)
                        .clipShape(Circle())
                }
                .clipShape(Circle())
            }
            .frame(width: size, height: size)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    phase = .pi * 2
                }
                withAnimation(.easeInOut(duration: 5)) {
                    fillLevel = 1.0
                }
            }
        }
        .frame(width: 200, height: 200)
        .padding()
    }
}
