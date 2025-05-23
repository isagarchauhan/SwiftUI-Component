//
//  Wave.swift
//  WaterFillingAnimation
//
//  Created by Sagar Chauhan on 23/05/25.
//

import SwiftUI

/*
 phase: Controls the horizontal shift of the wave, enabling animation to make the wave appear moving.
 amplitude: The height of the wave peaks (how “tall” the waves are).
 frequence: How many waves fit across the width.
 animatableData: Enables SwiftUI to animate changes to the phase value smoothly.
 path(in rect:):
    - Starts from the middle height vertically.
    - Loops over all horizontal points, calculating vertical y-values as a sine wave.
    - Draws a line following this sine wave.
    - Closes the path along the bottom edges so it can be filled as a shape.
 */
struct Wave: Shape {
    // Phase shifts for animating the wave horizontally
    var phase: CGFloat
    var amplitude: CGFloat = 10
    var frequency: CGFloat = 2
    
    // Animateable property
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midHeight = rect.height / 2
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / rect.width
            let y = amplitude * sin(relativeX * frequency * 2 * .pi + phase) + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        // Close the path at the bottom
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
