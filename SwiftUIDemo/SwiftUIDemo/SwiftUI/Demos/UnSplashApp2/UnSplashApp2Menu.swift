//
//  UnSplashApp2Menu.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/16.
//

import SwiftUI

struct UnSplashApp2Menu: View {
    
    var titles : [String]
    
    var seletedAction: (Int) -> Void
    
    @State var seleteIndex  = 0
    
    var body: some View {
        
        HStack{
            ForEach(0..<titles.count, id: \.self){ index in
                Button(action: {
                    self.seleteIndex = index
                    self.seletedAction(index)
                }){
                    VStack(alignment: .center){
                        Text(titles[index])
                            .foregroundColor(.black)
                        
                        Capsule()
                            .fill(self.seleteIndex == index ? Color.black : Color.clear)
                            .frame(height: 6)
                            .padding(.horizontal, 6)
                    }
                }
            }
        }
        
        
    }
}

