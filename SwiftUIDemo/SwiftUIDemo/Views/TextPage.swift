//
//  TextPage.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2019/7/2.
//  Copyright © 2019 Ethanz. All rights reserved.
//

import SwiftUI

struct TextPage : View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            
            Text("Hello SwiftUI")
            //Style
            Text("Hello SwiftUI")
                .font(.title)
                .fontWeight(.heavy)
                .color(.red)
                .bold()
                .italic()   //斜体
                .kerning(5)  //字距
                .strikethrough(color: .yellow)  //中划线
                .underline(color: .blue)   // 下划线
                .lineLimit(2)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
            
            Text("Hello").color(.orange) +
                Text(" SwiftUI").color(.green)
            
            Text("Hello \nSwiftUI")
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
           
            
        }
    }
}

#if DEBUG
struct TextPage_Previews : PreviewProvider {
    static var previews: some View {
        TextPage()
    }
}
#endif
