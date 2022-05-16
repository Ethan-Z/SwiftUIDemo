//
//  ContentView.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/13.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView(content: {
            List{
                NavigationLink(destination: BaseViewList()) {
                    Text("Base Views")
                }
                
                NavigationLink(destination: DemoList()) {
                    Text("Demo Lists")
                }
               
            }
            .navigationTitle("列表")
        })

                
        
    }
}

