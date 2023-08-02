//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 01/08/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom) :
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                                   startPoint: .top,
                                   endPoint: .bottom))
            .cornerRadius(40)
    }
}
