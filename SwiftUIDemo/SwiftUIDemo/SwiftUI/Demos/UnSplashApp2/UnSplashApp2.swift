//
//  UnSplashApp2.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/16.
//

import SwiftUI

struct UnSplashApp2: View {
    
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    @State var search = ""
    
    let menu  = ["Nature", "Animals", "Fish", "Flowers"]
    
    @State var seletedPothos = [ ["s11","s21"],["s21","s22"],["s31","s32"] ]
    
    @State var nature = [ ["s11","s21"],["s21","s22"],["s31","s32"] ]
    @State var flowers = [ ["f11","f21"],["f21","f22"],["f31","f32"] ]
    @State var fish = [ ["m11","m21"],["m21","m22"],["m31","m32"] ]
    @State var animals = [ ["a11","a21"],["a21","a22"],["a31","a32"] ]

    
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Button(action: {
                    presentMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .frame(width: 23, height: 23)

                }
                
                Spacer()
                
//                Image("logo")
//
//                Spacer()
                
                Button(action: {
                    
                }){
                    Image("menu")
                        .resizable()
                        .frame(width: 23, height: 23)
                }
            }
            .padding()
            .background(Color.white)
            .overlay( Image("logo") )
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment:.leading, spacing: 15){
                    
                    // search
                    HStack{
                        Image("search")
                        TextField("search...", text: $search)
                    }
                    .padding(12)
                    .background(Color("UnSplashApp2Color"))
                    .clipShape(Capsule())
                    .padding(.top, 5)
                    .padding(.horizontal, 12)
                    
                    // main Image
                    ZStack(alignment: .bottomLeading){
                        
                        Image("main")
                            .resizable()
                            .frame(height: 350)
                            .padding(.horizontal)
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                
                            }){
                                Image("add")
                            }
                            
                            Button(action: {
                                
                            }){
                                Image("heart")
                            }
                            
                            Button(action: {
                                
                            }){
                                Image("download")
                            }
                        }
                        .padding()
                        .padding(.trailing)
                        
                        
                        
                    }
                    
                    Text("Trending")
                        .font(.title)
                        .padding()
                    // 目录
                    UnSplashApp2Menu(titles: menu, seletedAction: { index in
                        switch index {
                        case 0:
                            self.seletedPothos = nature
                        case 1:
                            self.seletedPothos = animals
                        case 2:
                            self.seletedPothos = fish
                        default:
                            self.seletedPothos = flowers
                        }
                        
                    })
                    .padding(.horizontal)
                    
                    
                    UnSplashApp2PhotoList(photos: seletedPothos)
                                        
                }

                
            }
            
    
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("UnSplashApp2bg").edgesIgnoringSafeArea(.bottom))
        .navigationBarHidden(true)

        
        
        
        
    }
}

struct UnSplashApp2_Previews: PreviewProvider {
    static var previews: some View {
        UnSplashApp2()
    }
}
