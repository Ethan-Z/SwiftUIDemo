//
//  BaseViewList.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/5/7.
//

import SwiftUI

struct BaseViewList: View {
    var body: some View {
        List{
            Section {
                NavigationLink(destination: AccessibilityModifier()) {
                    Text("Accessibility")
                }
                NavigationLink(destination: AppearanceModifier()) {
                    Text("Appearance")
                }
            } header: {
                Text("View modifier")
            }
        }
    }
}

struct BaseViewList_Previews: PreviewProvider {
    static var previews: some View {
        BaseViewList()
    }
}
