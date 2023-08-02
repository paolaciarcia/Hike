//
//  CustomListRowView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 02/08/23.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel: String
    @State var rowContent: String
    @State var rowIcon: String
    @State var rowTintColor: Color
    @State var isLink: Bool = false
    @State var rowLinkDestination: String? = "https://github.com/paolaciarcia"

    var body: some View {
        LabeledContent {
            if isLink {
                if let linkDestination = rowLinkDestination,
                    let url = URL(string: linkDestination) {
                    Link(rowContent, destination: url)
                        .foregroundColor(.pink)
                        .fontWeight(.heavy)
                }
            } else {
                Text(rowContent)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }

        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)

                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)

                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(rowLabel: "Application",
                              rowContent: "GitHub",
                              rowIcon: "apps.iphone",
                              rowTintColor: .blue,
                              isLink: true)
        }
    }
}
