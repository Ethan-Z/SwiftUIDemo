//
//  PlayStation5UI.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/9/6.
//

import SwiftUI

struct PlayStation5UI: View {
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment:.leading,spacing:0){
            
            
            
            ZStack(alignment:.bottomLeading){
                VStack{
                    HStack{
                        Button {
                            self.presentMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .renderingMode(.original)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("cart")
                                .renderingMode(.original)
                                .padding(10)
                                .background(Color(0x0F1622))
                                .clipShape(Circle())
                               
                        }

                        
                    }
                    .padding(.bottom)
                    .padding(.top, windowsSafeAreaInsets?.top)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.08))
                    
                    
                    HStack(alignment:.top){
                        VStack(alignment:.leading ,spacing:12){
                            Text("PLATFORM")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                            Text("PS5")
                                .foregroundColor(.white)
                           
                            
                            Text("RELEASE")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                                .padding(.top, 10)
                            Text("JUNE 11")
                                .foregroundColor(.white)
                            
                            
                            Text("PRICE")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                                .padding(.top, 10)
                            
                            Text("$500")
                                .foregroundColor(.white)
                        }
                        .offset(y: -15)
                       
                        Spacer()
                        
                        Image("joystick")
                            .rotationEffect(.init(degrees: -90))
                            .padding(.horizontal, -70)
                            
                        
                    }
                    .padding(.horizontal)
            
                }
                .padding(.bottom, -35)
                .background(
                    ZStack(alignment:.topTrailing){
                        LinearGradient(colors: [Color(0x6CD8E4),Color(0x4D4AE9)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        Image("topBg")
                    }
                )
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "bookmark")
                        .foregroundColor(.white.opacity(0.5))
                        .padding(18)
                        .background(Color(0x0F1622))
                        .clipShape(Circle())
                }
                .padding(.leading)
                .offset(y: 30)
                .shadow(color: .black.opacity(0.9), radius: 5, x: 5, y: 5)

               
               
                
            }
            
            HStack{
                VStack(alignment:.leading,spacing: 12){
                    Text("Dual Sense")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text("DualSense also adds a built-in microphone array, which will enable players to easily chat with friends without a headset.")
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 35)
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            HStack(alignment:.top){
                PlayStationUIButton(imageName: "s1", title: "Fuistic", subTitle: "Design")
                Spacer(minLength: 0)
                PlayStationUIButton(imageName: "s2", title: "Buily-in", subTitle: "Micropone")
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            HStack{
                PlayStationUIButton(imageName: "s3", title: "Hoptic", subTitle: "Feedback")
                Spacer(minLength: 0)
                PlayStationUIButton(imageName: "s4", title: "Fast Charge", subTitle: "USB-C Port")
            }
            .padding(.top, 20)
            .padding(.horizontal)
          
            
            HStack(alignment:.center){
                Spacer()
                
                Button {
                    
                } label: {
                    
                    HStack{
                        Text("$")
                            .font(.title2)
                            .foregroundColor(Color(0x447478))
                        Text("500")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.trailing, 30)
                       
                        HStack(spacing:20){
                            Text("Preorder")
                                .foregroundColor(.white)
                                .bold()
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                            
                                .font(.title2)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(
                            LinearGradient(colors: [Color(0x6CD8E4),Color(0x4D4AE9)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(0x111322))
                    .cornerRadius(10)
                    .shadow(color: .white.opacity(0.05), radius: 5, x: -5, y: -5)
                    .shadow(color: .black.opacity(0.9), radius: 5, x: 5, y: 5)
                    
                    
                    
                }
                Spacer()
            }
            .padding(.top, 50)
            
       
            Spacer()
           
         
            
    
        }
        .background(
            Color(0x0F1622).ignoresSafeArea()
        )
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}


fileprivate struct PlayStationUIButton : View {
    
    let imageName: String
    let title: String
    let subTitle: String
    
    
    var body: some View {
        
        HStack{
            Button {
                
            } label: {
                Image(imageName)
                    .renderingMode(.original)
                    .frame(width: 60, height: 60)

                    .background(Color(0x111322))
                    .cornerRadius(10)
                    .shadow(color: .white.opacity(0.05), radius: 5, x: -5, y: -5)
                    .shadow(color: .black.opacity(0.9), radius: 5, x: 5, y: 5)
                
            }
            .padding(.trailing, 12)
       
            VStack(alignment: .leading,spacing: 3){
                Text(title)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    
                Text(subTitle)
                    .foregroundColor(.white.opacity(0.5))
                    .font(.system(size: 14))
                    .lineLimit(1)
                
                
            }
            Spacer(minLength: 0)
        }
        
    }
}




struct PlayStation5UI_Previews: PreviewProvider {
    static var previews: some View {
        PlayStation5UI()
    }
}
