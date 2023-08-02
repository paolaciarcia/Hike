//
//  CustomButtonView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 01/08/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                                       startPoint: .top,
                                       endPoint: .bottom),
                        lineWidth: 4)

            Image(systemName: HikeSymbolShortcuts.figureHiking)
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                                                startPoint: .top,
                                                endPoint: .bottom))
        }
        .frame(width: 58, height: 58)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
