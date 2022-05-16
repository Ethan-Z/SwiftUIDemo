//
//  AppearanceModifier.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/5/8.
//

import SwiftUI

struct AppearanceModifier: View {
    var body: some View {
        VStack{
            HStack{
                HStack{
                    demoView.background(Image("a31"))
                        .scaledToFit()
                }.frame(width:200, height:200)
            }
            Text("ethanz")
                .bold()
                .foregroundStyle(Color("testColor"))
        }
    }
    
    var demoView: some View {
            
        Text("ehtjansasldk")
            .lineLimit(1)
            .foregroundColor(.blue)
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
        
    }
    
}

struct AppearanceModifier_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceModifier().preferredColorScheme(.light)
    }
}
