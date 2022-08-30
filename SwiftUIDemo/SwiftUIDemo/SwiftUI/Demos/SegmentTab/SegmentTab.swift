//
//  SegmentTab.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/7/20.
//

import SwiftUI

struct SegmentTab: View {
    
    
    @State var offset = UIScreen.main.bounds.width
    @State var index = 1
    
    let screenWidth =  UIScreen.main.bounds.width
    
   
    
    var body: some View {
        VStack(alignment:.leading){
            TopTabView(index: self.$index, offset: self.$offset)
//            ScrollView(.horizontal, showsIndicators: false){
//                ScrollViewReader { proxy in
            GeometryReader { g in
                HStack(spacing:0){
                        ListImageView(imageName: "m21")
                            .frame(width: g.frame(in: .global).width)
                            .id(1)
                        ListImageView(imageName: "m22")
                            .frame(width:g.frame(in: .global).width)
                            .id(2)
                        ListImageView(imageName: "m31")
                            .frame(width: g.frame(in: .global).width)
                            .id(3)
                    }
//                    .onChange(of: self.index) { newValue in
//                        withAnimation {
//                            self.offset =  Double(newValue) * screenWidth
////                            proxy.scrollTo(newValue, anchor: .topLeading)
//                        }
//                    }
                    .offset(x: self.offset)
                    .highPriorityGesture(DragGesture().onEnded({ value in
                        
                        if value.translation.width >= 50 {
                            self.dragViewWith(left: false)
                        }
                        
                        if -value.translation.width > 50 {
                            self.dragViewWith(left: true)
                        }
                    }) )
            }

        }
        .animation(.default,value: 2)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
    
    func dragViewWith( left : Bool){
        
        if left {
            
            if self.index != 3 {
                self.index += 1
            }
        }else{
            if self.index != 0 {
                self.index -= 1
            }
        }
        if self.index == 1{
            
            self.offset = self.screenWidth
        }
        else if self.index == 2{
            
            self.offset = 0
        }
        else{
            
            self.offset = -self.screenWidth
        }
        
    }
}


fileprivate struct ListImageView : View{
    
    let imageName : String
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            VStack {
                
                ForEach(0...4, id: \.self){ i in
                    Image(imageName)
                        .resizable()
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                }
            }
        }
//        .frame(width: UIScreen.main.bounds.width)
    }
}


fileprivate struct TopTabView : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    var body: some View{
        
        
        VStack(alignment:.leading,spacing: 10) {
            
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack{
                TabItem(imageName: "house.fill", title: "Home", isSelect: self.index == 1) {
                    self.index = 1
                    self.offset = self.width
                }
                TabItem(imageName: "rectangle.grid.2x2", title: "Center", isSelect: self.index == 2) {
                    self.index = 2
                    self.offset = 0
                }
                TabItem(imageName: "person", title: "Profit", isSelect: self.index == 3) {
                    self.index = 3
                    self.offset = -self.width
                }
            }

        }
        
        .padding(.top, (windowsSafeAreaInsets?.top ?? 0) + 15)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .background(.red)

    }
    
}

fileprivate struct TabItem : View {
//
    let imageName : String
    let title:  String
    let isSelect: Bool
    let action: () -> Void
    
    
    var body: some View{
        
    
        
        VStack{
            
            HStack{
                Image(systemName: self.imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.isSelect ? .white : .white.opacity(0.7))
                
                Text(self.title)
                    .font(.caption)
                    .foregroundColor(self.isSelect ? .white : .white.opacity(0.7))
            }
            
            Capsule()
                .fill(self.isSelect ? .white : .clear)
                .frame(height: 2)
                .padding(.horizontal)
                
                
            
            
        }.onTapGesture(perform: self.action)
        
    }
    
}




struct SegmentTab_Previews: PreviewProvider {
    static var previews: some View {
        SegmentTab()
    }
}
