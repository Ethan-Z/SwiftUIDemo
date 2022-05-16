//
//  SwipeMenu.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2021/7/28.
//

import SwiftUI

struct SwipeMenu: View {
    
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    @State var offsetY : CGFloat = UIScreen.main.bounds.height - 130
    
    @State var isTop = false
    
    var body: some View {
        
        ZStack {
            Color.orange.ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action: {
                        presentMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                            .frame(width: 23, height: 23)

                    }
                    .padding()
                    Spacer()
                }
                .offset(y: 30)
                
                Spacer()
            }
            
            SwipeView()
                .cornerRadius(18)
                .padding()
                .offset(y: offsetY)
                .gesture(dragGesture)
                .animation(.spring())

        }
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)

    }
    
    var dragGesture : some Gesture {
        
        DragGesture()
            .onChanged { value in
                print( "origin = \(value.startLocation), current = \(value.location) width = \(value.translation.width); height = \(value.translation.height) ")
                
                if isTop{
                    self.offsetY = value.translation.height
                }else{
                    let temp = UIScreen.main.bounds.height - 130
                    self.offsetY = temp + value.translation.height
                }
            }
            .onEnded { value in
                if value.translation.height > 0 { // 向下滑
                    if isTop{
                        if value.translation.height > 200 {
                            self.offsetY = UIScreen.main.bounds.height - 130
                            self.isTop = false
                        }else{
                            self.offsetY = 15
                        }
                    }else{
                        self.offsetY = UIScreen.main.bounds.height - 130
                    }
                 
                        
                   
                    
                }else{ // 向上滑

                    if isTop{
                        self.offsetY = 15
                    }else{
                        if value.translation.height < -200{
                            self.offsetY = 15
                            self.isTop = true
                        }else{
                            self.offsetY = UIScreen.main.bounds.height - 130
                        }
                    }
                    
                    
                }
                
            }
        
        
    }
    
    
}


struct SwipeView : View {
    
    var body: some View {
        
        VStack{
         
            Text("Swipe up to See More")
                .fontWeight(.heavy)
                .padding([.top, .bottom], 15)
            
            HStack{
                Spacer()
                Text("hello top")
                    .fontWeight(.heavy)
                    .padding()
            }
            Spacer()
            
            Text("hello bottom")
                .fontWeight(.heavy)
                .padding()
        }
        .background(Color.white)
    }
    
    
}



struct SwipeMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwipeMenu()
    }
}
