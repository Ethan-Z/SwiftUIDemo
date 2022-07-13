//
//  SteamUI.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/7/13.
//

import SwiftUI

struct SteamUI: View {
    var body: some View {
      
        TabView {
            SteamUIHome().tabItem {
                Image("tab_home")
            }
            Text("Search").tabItem {
                Image("tab_search")
            }
            Text("Person").tabItem {
                Image("tab_person")
            }
            Text("Menu").tabItem {
                Image("tab_menu")
            }
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.top)
        
    }
}

fileprivate struct SteamUIHome: View {
    
    let itmes = [
        SteamGameSection(title: "Featured", games: [
            SteamGameItem(iamgeName: "m11", width: 200, height: 150),
            SteamGameItem(iamgeName: "m12", width: 200, height: 150),
            SteamGameItem(iamgeName: "m21", width: 200, height: 150)
        ]),
       
        SteamGameSection(
            title: "New On Steam",
            games: [
                SteamGameItem(iamgeName: "m11", width: 150, height: 150),
                SteamGameItem(iamgeName: "m12", width: 150, height: 150),
                SteamGameItem(iamgeName: "m21", width: 150, height: 150)
            ]
        ),
        SteamGameSection(
            title: "Recommended",
            games : [
                SteamGameItem(iamgeName: "m11", width: 150, height: 150),
                SteamGameItem(iamgeName: "m12", width: 150, height: 150),
                SteamGameItem(iamgeName: "m21", width: 150, height: 150)
            ]
        ),
    ]
    
    
    var body: some View{
        
        VStack{
            
            HStack{
                Text("$89").bold()
                Spacer()
                Image("steam_logo")
                Spacer()
                Image("cart")
            }.frame(height: 64)
                .padding(.horizontal)
                
           
            ScrollView {
                
                
                ForEach(itmes) { section in
                    VStack(alignment: .leading){
                        HStack{
                            Text(section.title)
                                .foregroundColor(.white)
                                .font(.system(size: 28).bold())
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(section.games) { game in
                                    Image(game.iamgeName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: game.width, height: game.height)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                }
                                
                               
                            }
                        }
                    }
                }
                
              
            }
            .padding(.horizontal)
            
            
            
            
        }
    }
    
}

fileprivate struct SteamGameSection : Identifiable {
    
    let id = UUID().uuidString
    let title : String
    let games : [SteamGameItem]
    
}

fileprivate struct SteamGameItem : Identifiable {
    
    let id = UUID().uuidString
    let iamgeName : String
    let width: CGFloat
    let height: CGFloat
}



struct SteamUI_Previews: PreviewProvider {
    static var previews: some View {
        SteamUI()
    }
}
