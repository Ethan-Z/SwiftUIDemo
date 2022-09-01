//
//  ResizableHeader.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/9/1.
//

import SwiftUI

struct ResizableHeader: View {
    
    
    @State var index = 0
    
    @State var isShow = true
    var body: some View {
        VStack{
            ResizableHeaderTabView(index: self.$index, isShow: self.$isShow)
            ZStack{
                ResizableHeaderList(isShow: self.$isShow, imageName: "bean")
                    .opacity(self.index == 0 ? 1 : 0)
                ResizableHeaderList(isShow: self.$isShow, imageName: "f11")
                    .opacity(self.index == 1 ? 1 : 0)
                ResizableHeaderList(isShow: self.$isShow,imageName: "f12")
                    .opacity(self.index == 2 ? 1 : 0)
            }
        }
        .ignoresSafeArea()
    }
}


struct ResizableHeaderTabView: View{
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    @Binding var index : Int
    @Binding var isShow: Bool
    
    var body: some View {
        VStack(spacing: 15){
            if isShow {
                HStack(spacing: 10){
                     Text("WhatsApp")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        
                    Spacer()
                    Button {
                        self.presentMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                            
                    }
                    
                    Button {
                    
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title2)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.black)
                            
                    }
                }
            }
          
            
            HStack{
                
                Button {
                    self.index = 0
                } label: {
                    VStack{
                        Text("Chats")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule()
                            .frame(height:4)
                            .foregroundColor(self.index == 0 ? .white : .clear)
                        
                    }
                }
                
                Button {
                    self.index = 1
                } label: {
                    VStack{
                        Text("State")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        Capsule()
                            .frame(height:4)
                            .foregroundColor(self.index == 1 ? .white : .clear)
                        
                    }
                }
                Button {
                    self.index = 2
                } label: {
                    VStack{
                        Text("Calls")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule()
                            .frame(height:4)
                            .foregroundColor(self.index == 2 ? .white : .clear)
                        
                    }
                }
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
        .padding(.top, (windowsSafeAreaInsets?.top ?? 0) + 10.0)
        .background(Color(0x2F5C55))
    }
    
}


struct ResizableHeaderList : View {
    
    
    @Binding var isShow : Bool
    var imageName: String
    
    var body: some View {
        
        List {
            ForEach(0...20, id: \.self){index in
                if index == 0 {
                    ResizableHeaderRow(imageName: self.imageName).onAppear {
                        withAnimation {
                            self.isShow = true
                        }
                    }
                    .onDisappear {
                        withAnimation {
                            self.isShow = false
                        }
                    }
                }else{
                    ResizableHeaderRow(imageName: self.imageName)
                }
            }
            
        }
        
    }
}


struct ResizableHeaderRow : View{
    
    var imageName: String
    
    var body: some View{
        
        HStack{
            
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment:.leading,spacing:5){
                Text("Ethanz")
                    .font(.title2)
                Text("Msg")
            }
            
        }
       
        
            
        
    }
}



struct ResizableHeader_Previews: PreviewProvider {
    static var previews: some View {
        ResizableHeader()
    }
}
