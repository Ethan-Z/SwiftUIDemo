//
//  SimmerEffect.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/7/18.
//

import SwiftUI

struct SimmerEffect: View {
    @State var showTextView = false
    @State var images : [String] =  []
    
    var body: some View {
          
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                
                if self.images.isEmpty {
                    ForEach(0...10, id: \.self){_ in

                        CardSimmer()

                    }
                } else {
                    ForEach(self.images, id:\.self){imageName in
                        
                        ImageCard(imageName: imageName)
                            .onTapGesture {
                                self.showTextView.toggle()
                            }
                    }
                    
                }
            }
        }
        .sheet(isPresented: self.$showTextView, content: {
            TextSimmer()
        })
        .navigationBarItems(trailing:
            Button {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2)  {
                    self.images = ["m11","m12", "m21","m22" ]
                }
            } label: {
                Image(systemName: "plus")
            }

            
        )
        .foregroundColor(.black)
        .navigationTitle("Simmer")
        .navigationBarTitleDisplayMode(.inline)
            
    }
}


fileprivate struct ImageCard : View {
    
    let imageName : String
    
    var body: some View {
        
        Image(imageName)
            .resizable()
            .frame( height: 200)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.vertical)
        
    }
}


fileprivate struct CardSimmer : View {
    
    @State var showAnimation = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    
    var body: some View {
        
        ZStack{
            
            
            Color.black.opacity(0.2)
                .frame(height: 200)
                .cornerRadius(20)
                
            
            Color.white
                .frame(height: 200)
                .cornerRadius(20)
                .mask {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(0.25), .clear]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.init(degrees: 70))
                        .offset(x: self.showAnimation ?  center : -center)
                }
        

                
        }
        .padding(.horizontal)
        .padding(.vertical)
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(Animation.default.speed(0.20).repeatForever(autoreverses: false)) {
                    self.showAnimation.toggle()
                }
            }
           
        }
        


    }
    
    
}



fileprivate struct TextSimmer : View{
    
    @State var show = false
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            Text("Ethanzym")
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 40))
                
            
            
            Text("Ethanzym")
                .foregroundColor(Color.white)
                .font(.system(size: 40))
                .mask {
                    Capsule()
                        .fill(LinearGradient(gradient: .init(colors: [.clear,.white,.clear]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .rotationEffect(.init(degrees: 30))
                        .offset(x: self.show ? 180 : -120)
                }
            
            
            
        }.onAppear {
            
            
            withAnimation(Animation.default.speed(0.3).delay(0.0).repeatForever(autoreverses: false)) {
                
                self.show.toggle()
            }
        }
        
    }
    
    
    
}


struct SimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SimmerEffect()
        }
     
    }
}
