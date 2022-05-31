//
//  ViewTraining.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/5/18.
//

import SwiftUI

struct ViewTraining: View {
        
    
    
    var body: some View {
        
        VStack{
            Text("Thi")
                .badge("3j")

            
                
            
            Text("ethanz")
                .redacted(reason: .placeholder)
                .frame(width: 120, height: 40)
            
            
            Text("Account #")

                      Text("accountNumber")
                          .font(.headline)
                          .privacySensitive()
                
            Button("ethanz") {
                
            }

                .tint(.pink)

                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 68))
                .controlSize(.regular)
                

//
                
                
            
            
            Button("New action") {}
                .tint(.green)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
        }
      
           
        
            
    
      
    }
    
    func overlayDemo() -> some View {
        Button("ethanz") {
            
        }
        .background(.red)
        .frame(width: 200, height: 200)
        .overlay {
            Rectangle()
                .fill(Color.blue)
                      .frame(width: 20, height: 20, alignment: .center)
                      .rotationEffect(.degrees(45.0))
            Rectangle()
                .fill(Color.yellow)
                      .frame(width: 20, height: 20, alignment: .center)
                      .rotationEffect(.degrees(90.0))
        }
    }
    
    func listViewSeparator() -> some View {
        List{
            ForEach(Range(1...20)){ item in
                Text("text -- \(item)")
                //分隔符颜色
                    .listRowSeparatorTint(.red, edges: .bottom)
                //是否可见分隔符
                    .listRowSeparator(.visible)
                    .listStyle(.plain)
                // listrow 内间距
                        .listRowInsets(.init(top: 20, leading: 10, bottom: 10, trailing: 20))
                    .listItemTint(.blue)
                    
                
            }
        }
    }
    
    
    func getForeefroundStyleDemo() -> some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 80, height: 60)
                .foregroundStyle(.linearGradient(colors: [.red,.teal], startPoint: .bottomLeading, endPoint: .topTrailing)
                )
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 80, height: 60)
                .foregroundStyle(.image(Image("a31")))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 80, height: 60)
                .foregroundStyle(.angularGradient(colors: [.yellow,.red], center: .center, startAngle: .degrees(0.0), endAngle: .degrees(0)))
        
            Text("Ethanz").font(.title).fontWeight(.bold).foregroundStyle(.image(Image("a31")))
            
            Text("Ethanz").font(.title).fontWeight(.bold)
            Text("Ethanz").font(.title).fontWeight(.bold).foregroundStyle(.secondary)
        }
    }
    
}

struct ViewTraining_Previews: PreviewProvider {
    static var previews: some View {
        
        ViewTraining()
            
        
    }
}
