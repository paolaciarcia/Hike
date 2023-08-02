//
//  CustomCircleView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 01/08/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient = false

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium,
                                            .customSalmonLight],
                                   startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing))

                .onAppear {
                    withAnimation(.linear(duration: 4.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
