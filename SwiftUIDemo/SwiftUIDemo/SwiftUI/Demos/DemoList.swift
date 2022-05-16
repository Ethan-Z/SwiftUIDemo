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
                NavigationLink(destination: BGTimer()){
                    Text("BGTimer")
                }
                NavigationLink(destination: SwipeMenu()){
                    Text("SwipeMenu")
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
