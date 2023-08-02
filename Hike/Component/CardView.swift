//
//  CardView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 01/08/23.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    @State private var isShowingSheet = false

    private func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while imageNumber == randomNumber
        imageNumber = randomNumber
    }

    var body: some View {
        ZStack {
            CustomBackgroundView()

            VStack {
                //MARK: -HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text(HikeStrings.hiking)
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,
                                                        .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom))
                        Spacer()
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDetents([.medium, .large])
                                .presentationDragIndicator(.visible)
                        }
                    }

                    Text(HikeStrings.hikingSubtitle)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)

                ZStack {
                    CustomCircleView()

                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,
                                   value: imageNumber)
                }

                Button {
                    randomImage()
                } label: {
                    Text(HikeStrings.exploreMore)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                            colors: [.customGreenLight, .customGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
