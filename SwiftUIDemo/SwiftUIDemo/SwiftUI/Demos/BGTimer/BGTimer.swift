//
//  BGTimer.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2021/7/23.
//

import SwiftUI
import UserNotifications

struct BGTimer : View {
        
    @State var start = false
    
    @State var to = 0
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    func notify(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Time is completed successfully in background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        
        
    }
    
    var body: some View{
        
        ZStack{
            
            Color.black.opacity(0.05).ignoresSafeArea(.all)
            
            VStack{
                
                ZStack{
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), lineWidth: 35)
                        .frame(width: 280, height: 280)
//                        .border(Color.red)

                        
                    Circle()
                        .trim(from: 0, to: CGFloat(self.to)/15.0)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(Angle(degrees: -90))
                    
                    VStack(spacing: 15){
                        Text("\(self.to)")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                        
                        Text("Of 15")
                            .font(.title)
                        
                    }
                    
                    
                }
            
                
                HStack(spacing: 10){
                    
                    Button(action: {
                        self.start.toggle()
                    }){
                        HStack{
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                            
                            Text(self.start ? "Pause" : "start")
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width - 90)/2)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    }
                    
                    Button(action: {
                        withAnimation {
                            self.to = 0
                        }
                    }){
                        HStack{
                            Image(systemName: "arrow.clockwise")
                            
                            Text("Restart")
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width - 90)/2)
                        .foregroundColor(.red)
                        .background(Capsule().stroke(Color.red, lineWidth: 3.0))
                        .shadow(radius: 5)
                        
                        
                    }
                    
                }
                .padding(.top, 40)
                
            }
            .padding()
            
            
        }
        .onReceive(self.timer, perform: { _ in
            if self.start {
                if self.to < 15 {
                    withAnimation {
                        self.to += 1
                    }
                    print("hello")
                }else{
                    self.start.toggle()
                    self.notify()
                    
                }
            }
            
        })
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { _, _ in }
        })
        
        
    }
}



struct BGTimer_Previews: PreviewProvider {
    static var previews: some View {
        BGTimer()
    }
}
