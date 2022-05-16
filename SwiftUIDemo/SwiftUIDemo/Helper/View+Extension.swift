//
//  View+Extension.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/15.
//

import SwiftUI
import Combine

extension View {
    
    var safeAreaInsets : UIEdgeInsets? {
        UIApplication.shared.windows.first?.safeAreaInsets
    }
    
}



