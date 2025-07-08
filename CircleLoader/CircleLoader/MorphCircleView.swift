//
//  MorphCircleView.swift
//  CircleLoader
//
//  Created by Sagar Chauhan on 08/07/25.
//

import SwiftUI

struct MorphCircleModel {
    let circleCount: Int
    let circleSize: CGFloat
    let backgroundCircleRadius: CGFloat
    let colors: [Color]
}

struct AnimatedCircle: View {
    let angle: Double
    let radius: CGFloat
    let size: CGFloat
    let color: Color
    
    @State private var pulse: Bool = false
    @State private var morph: Bool = false
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .scaleEffect(pulse ? 1.1 : 0.9)
            .scaleEffect(x: morph ? 1.2 : 0.9, y: morph ? 0.9 : 1.1)
            .offset(x: radius)
            .rotationEffect(.degrees(angle))
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    pulse = true
                }
                withAnimation(.easeIn(duration: 0.8).repeatForever(autoreverses: true)) {
                    morph = true
                }
            })
    }
}

struct MorphCircleView: View {
    
    @State private var isRotating = false
    var model: MorphCircleModel
    
    init(model: MorphCircleModel) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<model.circleCount, id: \.self) { index in
                AnimatedCircle(
                    angle: Double(index) * (360.0 / Double(model.circleCount)),
                    radius: model.backgroundCircleRadius,
                    size: model.circleSize,
                    color: model.colors[index % model.colors.count]
                )
            }
        }
        .rotationEffect(.degrees(isRotating ? 360 : 0))
        .onAppear() {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                isRotating = true
            }
        }
        .frame(
            width: model.backgroundCircleRadius * 2 + model.circleSize,
            height: model.backgroundCircleRadius * 2 + model.circleSize
        )
    }
}

#Preview {
    MorphCircleView(
        model: MorphCircleModel(
            circleCount: 3,
            circleSize: 30,
            backgroundCircleRadius: 60,
            colors: [.orange, .blue, .purple])
    )
}

