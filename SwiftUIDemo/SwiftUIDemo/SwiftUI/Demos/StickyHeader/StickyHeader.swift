//
//  StickyHeader.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/6/13.
//

import SwiftUI

struct StickyHeader: View {
    
    var datas = [

        StickyCardModel(id: 0, image: "g1", title: "Zombie Gunship Survival", subTitile: "Tour the apocalypse"),
        StickyCardModel(id: 1, image: "g2", title: "Portal", subTitile: "Travel through dimensions"),
        StickyCardModel(id: 2, image: "g3", title: "Wave Form", subTitile: "Fun enagaging wave game"),
        StickyCardModel(id: 3, image: "g4", title: "Temple Run", subTitile: "Run for your life"),
        StickyCardModel(id: 4, image: "g5", title: "World of Warcrat", subTitile: "Be whoever you want"),
        StickyCardModel(id: 5, image: "g6", title: "Alto’s Adventure", subTitile: "A snowboarding odyssey"),
        StickyCardModel(id: 6, image: "g7", title: "Space Frog", subTitile: "Jump and have fun"),
        StickyCardModel(id: 7, image: "g8", title: "Dinosaur Mario", subTitile: "Keep running")
    ]

    
    
    
    var body: some View {
        VStack{
            
            ScrollView {
                
                GeometryReader { geo in
                    
                    Image("poster")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.0)
                    
                }
                
                
                
               
                
                HStack{
                    Text("New Games We Love")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                        
                    Button {
                        
                    } label: {
                        Text("See ALL").fontWeight(.bold)
                    }

                }
                .padding()
                
                ForEach(datas) { item  in
                    StickyCard(cardModel: item)
                    
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct StickyCard : View {
    
    var cardModel : StickyCardModel
    
    var body: some View {
        
        HStack(alignment: .top ,spacing: 20){
            
            Image(cardModel.image)
                .resizable()
                .frame(width: 86, height: 86)
            
            VStack(alignment: .leading ){
                Text(cardModel.title)
                    .fontWeight(.bold)
                
                Text(cardModel.subTitile)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                HStack(spacing: 5){
                    Button {
                        
                    } label: {
                        
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.primary.opacity(0.05) )
                            .clipShape(Capsule())
                    }
                    
                    VStack(alignment:.leading){
                        Text("In-APP")
                        Text("Purchases")
                        
                    }
                    .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }.padding()
        
        
    }
    
}




struct StickyCardModel : Identifiable {
    
    var id : Int
    var image : String
    var title : String
    var subTitile : String
}




struct StickyHeader_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeader()
    }
}
