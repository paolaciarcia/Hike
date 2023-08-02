//
//  SettingsView.swift
//  Hike
//
//  Created by Paola Golombieski Ciarcia on 02/08/23.
//

import SwiftUI

struct SettingsView: View {
    private let alternateIcons = [
        HikeStrings.iconBackpack,
        HikeStrings.iconCamara,
        HikeStrings.iconCampfire,
        HikeStrings.iconMagnifyingGlass,
        HikeStrings.iconMap,
        HikeStrings.iconMushroom
    ]
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: HikeSymbolShortcuts.laurelLeading)
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text(HikeStrings.hike)
                            .font(.system(size: 66, weight: .black))
                        Text(HikeStrings.editorsChoice)
                            .fontWeight(.medium)
                    }
                    Image(systemName: HikeSymbolShortcuts.laurelTrailing)
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,
                                            .customGreenMedium,
                                            .customGreenDark],
                                   startPoint: .top,
                                   endPoint: .bottom))
                VStack(spacing: 8) {
                    Text(HikeStrings.hikeSheetTitle)
                        .font(.title2)
                    .fontWeight(.heavy)

                    Text(HikeStrings.hikeSheetSubtitle)
                        .font(.footnote)
                        .italic()

                    Text(HikeStrings.hikeSheetText)
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)

            Section(header: Text(HikeStrings.alternateIcons)) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateIcons.indices, id: \.self) { item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateIcons[item])
                            } label: {
                                Image("\(alternateIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                    .padding(.top, 12)
                }

                Text(HikeStrings.hikeSheetAppColletion)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)

            Section(header: Text(HikeStrings.sectionHeader),
                    footer: HStack {
                Spacer()
                Text(HikeStrings.allRightReserved)
                Spacer()}
                .padding(.vertical, 8)
            ){
                CustomListRowView(rowLabel: HikeStrings.application,
                                  rowContent: HikeStrings.hike,
                                  rowIcon: HikeSymbolShortcuts.appsIphone,
                                  rowTintColor: .blue)
                CustomListRowView(rowLabel: HikeStrings.compatibility,
                                  rowContent: HikeStrings.availableDevices,
                                  rowIcon: HikeSymbolShortcuts.infoCircle,
                                  rowTintColor: .red)
                CustomListRowView(rowLabel: HikeStrings.technology,
                                  rowContent: HikeStrings.swift,
                                  rowIcon: HikeSymbolShortcuts.swift,
                                  rowTintColor: .orange)
                CustomListRowView(rowLabel: HikeStrings.version,
                                  rowContent: HikeStrings.availableVersion,
                                  rowIcon: HikeSymbolShortcuts.gear,
                                  rowTintColor: .purple)
                CustomListRowView(rowLabel: HikeStrings.developer,
                                  rowContent: HikeStrings.developerName,
                                  rowIcon: HikeSymbolShortcuts.ellipsisCurlybraces,
                                  rowTintColor: .mint)
                CustomListRowView(rowLabel: HikeStrings.designer,
                                  rowContent: HikeStrings.developerName,
                                  rowIcon: HikeSymbolShortcuts.paintpalette,
                                  rowTintColor: .pink)
                CustomListRowView(rowLabel: HikeStrings.website,
                                  rowContent: HikeStrings.gitHub,
                                  rowIcon: HikeSymbolShortcuts.network,
                                  rowTintColor: .indigo,
                                  isLink: true)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
