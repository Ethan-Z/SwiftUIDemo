//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2019/7/2.
//  Copyright © 2019 Ethanz. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("控件").bold().font(.some(.system(size: 18)))) {
                    
                    NavigationButton(destination: TextPage()) {
                        Text("Text")
                    }
                }
            }.navigationBarTitle(Text("SwiftUI Study").color(.red), displayMode: .large)
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
