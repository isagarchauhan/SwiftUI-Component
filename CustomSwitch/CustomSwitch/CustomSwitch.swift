
//
//  CustomSwitch.swift
//  CustomSwitch
//
//  Created by Sagar Chauhan on 28/05/25.
//

import SwiftUI

struct CustomSwitch: View {
    @Binding var isOn: Bool
    var props: CustomSwitchProps
    var onToggle: ((Bool) -> Void)? = nil
    
    var body: some View {
        let switchWidth = props.size.width
        let switchHeight = props.size.height
        let thumbSize = switchHeight - 4
        let padding: CGFloat = 2
        
        HStack(spacing: 8) {
            
            ZStack(alignment: isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: switchHeight / 2)
                    .fill(isOn ? props.onColor : props.offColor)
                    .frame(width: switchWidth, height: switchHeight)
                
                Circle()
                    .fill(props.thumbColor)
                    .frame(width: thumbSize, height: thumbSize)
                    .padding(padding)
                    .shadow(radius: 1)
                    .overlay {
                        if isOn {
                            Image(systemName: "checkmark")
                                .resizable()
                                .foregroundStyle(props.onColor)
                                .frame(width: 10, height: 10)
                        }
                        
                        if !isOn {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundStyle(props.offColor)
                                .frame(width: 10, height: 10)
                        }
                    }
            }
            .animation(props.animation, value: isOn)
            .onTapGesture {
                isOn.toggle()
                onToggle?(isOn)
            }
        }
    }
}


struct CustomSwitchProps {
    var onColor: Color = .green
    var offColor: Color = .gray
    var thumbColor: Color = .white
    var size: CGSize = CGSize(width: 50, height: 30)
    var animation: Animation = .easeInOut(duration: 0.2)
}
