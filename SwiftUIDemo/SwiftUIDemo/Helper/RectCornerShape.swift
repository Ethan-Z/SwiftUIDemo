//
//  RectCornerShape.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/20.
//

import SwiftUI

struct RectCornerShape: Shape {
    
    let rectCorner : UIRectCorner
    let size : CGSize
    
    init(rectCorner: UIRectCorner, size: CGSize = CGSize(width: 25, height: 25)) {
        self.rectCorner = rectCorner
        self.size = size
    }
    
    init(bottomCorner size: CGSize){
        self.rectCorner = [.bottomLeft, .bottomRight]
        self.size = size
    }
    
    init(topCorner size: CGSize){
        self.rectCorner = [.topLeft, .topRight]
        self.size = size
    }
    
    init(leftCorner size: CGSize){
        self.rectCorner = [.bottomLeft, .topLeft]
        self.size = size
    }
    init(rightCorner size: CGSize){
        self.rectCorner = [.topRight, .bottomRight]
        self.size = size
    }
    
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: self.rectCorner, cornerRadii: size)
        return Path(path.cgPath)
        
    }
}

