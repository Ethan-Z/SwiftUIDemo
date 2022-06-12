//
//  View+Extension.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/15.
//

import SwiftUI
import Combine

extension View {
    
    var windowsSafeAreaInsets : UIEdgeInsets? {
    
        let windouScene = UIApplication.shared.connectedScenes.filter{$0 is UIWindowScene}.first as? UIWindowScene
        return windouScene?.keyWindow?.safeAreaInsets

    }
    
}



