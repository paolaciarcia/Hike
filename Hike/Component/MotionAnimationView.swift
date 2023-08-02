//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 01/08/23.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = true

    private func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: -100...256)
    }

    private func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }

    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }

    private func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }

    private func randomDelay() -> Double {
        return Double.random(in: 0...1)
    }

    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate())
                    .frame(width: randomSize())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25,
                                                 damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal))
    }
}
