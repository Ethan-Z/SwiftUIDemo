//
//  DemoList.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/5/7.
//

import SwiftUI

struct DemoList: View {
    var body: some View {
       
            List{
                Section {
                    NavigationLink(destination: VerticalTabbar()) {
                        Text("VerticalTabbar")
                    }
                    NavigationLink(destination: UnSplashApp()){
                        Text("UnSplashApp")
                    }
                    NavigationLink(destination: UnSplashApp2()){
                        Text("UnSplashApp2")
                    }
                    NavigationLink(destination: TravelAppUI()){
                        Text("TravelAppUI")
                    }
                    NavigationLink(destination: TodoList()){
                        Text("TodoList+CoreData")
                    }
                    NavigationLink(destination: SwipeMenu()){
                        Text("SwipeMenu")
                    }
                    NavigationLink(destination: Tiktok()){
                        Text("Tiktok")
                    }
                 
                    NavigationLink(destination: SteamUI()){
                        Text("SteamUI")
                    }
                    
                    NavigationLink(destination: SegmentTab()){
                        Text("SegmentTab")
                    }
                    NavigationLink(destination: ResizableHeader()){
                        Text("ResizableHeader")
                    }
                } header: {
                    Text("DemoView")
                }

                
                Section {
                    NavigationLink(destination: SpeedoMeter()){
                        Text("SpeedoMeter")
                    }
                    NavigationLink(destination: BGTimer()){
                        Text("BGTimer")
                    }
                    NavigationLink(destination: StickyHeader()){
                        Text("StickyHeader")
                    }
                    NavigationLink(destination: SimmerEffect()){
                        Text("SimmerEffect")
                    }
                } header: {
                    Text("effect")
                }
                
                
               
            }
            .navigationTitle("Demo List")
            
            
       

        
    }
}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}
