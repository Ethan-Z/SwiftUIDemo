//
//  SteamUI.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/7/13.
//

import SwiftUI

struct SteamUI: View {
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    var body: some View {
      
        TabView {
      
            SteamUIHome()
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height - 22)
        
            .tabItem {
                Image("tab_home")
            }
            
            Button {
                presentMode.wrappedValue.dismiss()
            } label: {
                Text("Back").foregroundColor(.white)
            }
            .tabItem {
                Image("tab_search")
                
                
            }
            Text("Person").tabItem {
                Image("tab_person")
            }
            Text("Menu").tabItem {
                Image("tab_menu")
            }
        }
        .ignoresSafeArea()
        .accentColor(.white)
        .foregroundColor(.black)
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
    
    
    @State var showDetail = false
    
    
    
    var body: some View{
        
        VStack{
            
            HStack{
                Text("$89").bold().foregroundColor(.white)
                Spacer()
                Image("steam_logo")
                Spacer()
                Button {
                   
                } label: {
                    Image("cart")
                }

            }.frame(height: 64)
            .padding(.horizontal)
                
            GeometryReader { geo in
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
                                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                                .onTapGesture {
                                                    showDetail.toggle()
                                                }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height )
            }
           
           
            
                                     
        }.popover(isPresented: $showDetail) {
            SteamUIGameDetail()
        }
        
        
    }
    
}

fileprivate struct SteamUIGameDetail : View {
    
    @State var selectTab = "about"
    
    var body: some View {
        VStack{
            Image("a32")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            ZStack{
                VStack{
                    
                    HStack(spacing: 20){
                        Button {
                            withAnimation {
                                self.selectTab = "about"
                            }
                        } label: {
                            Text("About")
                                .foregroundColor(self.selectTab == "about" ? .white : .gray)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectTab == "about" ? .gray.opacity(0.2) : .clear))
                            
                        }

                        Button {
                            withAnimation {
                                self.selectTab = "meidia"
                            }
                        } label: {
                            Text("Meidia")
                                .foregroundColor(self.selectTab == "meidia" ? .white : .gray)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectTab == "meidia" ? .gray.opacity(0.2) : .clear))
                        }
                        
                    }
                    .padding(.top,15)
                        
                    if self.selectTab == "about" {
                        SteamAboutView()
                    }else{
                        SteamMediaView()
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width)
                

            }.background(RectCornerShape(topCorner: CGSize(width: 25, height: 25)).fill(Color.black))
                .padding(.top, -20)
        }
        .ignoresSafeArea(edges: .bottom)
        
        
    }
}

fileprivate struct SteamAboutView : View {
    
    var body: some View {
        
        VStack(alignment:.leading,spacing: 25){
            
            Text("Welcome to San Francisco, the birthplace of the technological revolution. Play as young Marcus, a brilliant hacker, and join DedSec, the most celebrated hacker group. Your goal: the largest hacking operation in history.")
                .padding()
            
            HStack{
                Spacer()
                Text("More About This Game >")
            }
            
            Text("System Requirements")
            
            HStack{
                Image(systemName: "plus.magnifyingglass")
                Text("System Requirements")
            }
            
            HStack{
                Image(systemName: "minus.magnifyingglass")
                Text("System Requirements")
            }
            
            Spacer()
            
        }
        .font(.system(size: 18))
        .foregroundColor(Color.white.opacity(0.6))
        
        
    }
    
}

fileprivate struct SteamMediaView : View {
    
    var body: some View {
        VStack(spacing: 15){
            
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Text("image")
                        .foregroundColor(.white.opacity(0.4))
                        .font(.system(size: 18).bold())
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(["m21","m22", "m32"], id: \.self) { item in
                                Image(item)
                                    .resizable()
                                    .frame(width: 220, height: 150)
                                    .scaledToFill()
                        }
                    }
                }
                
                HStack{
                    Text("Video")
                        .foregroundColor(.white.opacity(0.4))
                        .font(.system(size: 18).bold())
                    Spacer()
                }
                
                ZStack(alignment: .center){
                    
                    Image("m22")
                        .resizable()
                        .frame(width: 220, height: 150)
                    
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
                
                
            }.padding(.horizontal)
            
            
            
            
            Spacer()
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
            .preferredColorScheme(.dark)
    }
}
