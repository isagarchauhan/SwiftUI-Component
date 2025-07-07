//
//  CircleLoaderView.swift
//  CircleLoader
//
//  Created by Sagar Chauhan on 07/07/25.
//

import SwiftUI

struct CircleLoaderModel {
    let circleCount: Int
    let circleSize: CGFloat
    let backGroundCircleRadius: CGFloat
    let overlapFactor: CGFloat
}

struct CircleLoaderView: View {
    
    @State private var isAnimating = false
    var model: CircleLoaderModel
    var colorArray: [Color] = []
    
    init(model: CircleLoaderModel) {
        self.model = model
    }
    
    var colors: [Color] {
        [.blue, .red, .green, .orange, .mint, .teal, .cyan, .indigo, .purple, .brown]
    }
    var body: some View {
        ZStack {
            ForEach(0..<model.circleCount, id: \.self) { index in
                Circle()
                    .fill(colors[index])
                    .frame(width: model.circleSize, height: model.circleSize)
                    .offset(x: model.backGroundCircleRadius)
                    .rotationEffect(
                        .degrees(
                            Double(index) * (360 / Double(model.circleCount))
                        )
                    )
                    .scaleEffect(model.overlapFactor)
            }
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
            .frame(
                width: model.backGroundCircleRadius * 2 + model.circleSize,
                height: model.backGroundCircleRadius * 2 + model.circleSize
            )
        }
        .background(
            Circle()
                .fill(Color.black.opacity(0.2))
        )
        .padding()
        .background(
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        )
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    CircleLoaderView(model: CircleLoaderModel(
        circleCount: 3,
        circleSize: 30,
        backGroundCircleRadius: 60,
        overlapFactor: 0.8)
    )
}
