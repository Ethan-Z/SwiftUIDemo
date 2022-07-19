//
//  SpeedoMeter.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/7/14.
//

import SwiftUI

struct SpeedoMeter: View {
    
    let colors = [Color(0x2876F6), Color(0x4FF5E6)]
    
    @State var progress = 0.0
    
    var body: some View {
        VStack{
            Spacer()
            
           
            ZStack(alignment:.bottom){
                
                // 进度条
                ZStack{
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.black.opacity(0.1), lineWidth: 55)
                        .frame(width: 280, height: 280)
                    
                    Circle()
                        .trim(from: 0, to: self.setProgress())
                        .stroke(AngularGradient(gradient: .init(colors: colors), center: .center, angle: .degrees(180)), lineWidth: 55)
                        .frame(width: 280, height: 280)
                }
                .rotationEffect(.degrees(180))
                
                // 指针
                VStack(spacing:0){
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 2, height: 80)
                    
                        .padding(.bottom, -8)
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.blue)
                }
                .rotationEffect(.degrees(-90), anchor: .bottom)
                .rotationEffect(.degrees(self.setAngle()), anchor: .bottom)
                .padding(.bottom, 140)
                
                
                
            }
            
            //按钮
            HStack(spacing: 20){
                
                Button {
                    
                    withAnimation(Animation.default.speed(0.5)) {
                        if(self.progress < 1.0){
                            let progress = self.progress + 0.05
                            if(progress >= 1.0){
                                self.progress = 1.0
                            }else{
                                self.progress = progress
                            }
                        }
                    }
                        
                    
                    
                } label: {
                    Text("Update")
                        .frame(width: 140, height: 40)
                        .background(Capsule().stroke(.linearGradient(colors: colors, startPoint: .leading, endPoint: .topTrailing), lineWidth: 2))
                }
                
                Button {
                    self.progress = 0.0
                    
                } label: {
                    Text("Reset")
                        .frame(width: 140, height: 40)
                        .background(Capsule().stroke(.linearGradient(colors: colors, startPoint: .leading, endPoint: .topTrailing), lineWidth: 2))
                }
            }
            .padding(.top, -100)
  
            Spacer()
            
        }
      
    }
    
    
    
    func setProgress() -> Double {
        
        return self.progress * 0.5
    }
    
    func setAngle() -> Double {
        
        return self.progress * 180
    }
    
}

struct SpeedoMeter_Previews: PreviewProvider {
    static var previews: some View {
        SpeedoMeter()
    }
}
