//
//  UnSplashApp2PhotoList.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/16.
//

import SwiftUI

struct UnSplashApp2PhotoList: View {
    
    var photos : [[String]]
    
    var body: some View {
        
        VStack(alignment: .center) {
            ForEach(photos, id:\.self){ images in
                
                HStack{
                    
                    ForEach(images, id: \.self){ imageName in
                        
                        Image(imageName)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/2 - 20, height: 180)
                            .cornerRadius(8)
                            .contextMenu(ContextMenu(menuItems: {
                               
                                Button(action: {
                                    
                                   UIImageWriteToSavedPhotosAlbum(UIImage(named: imageName)!, nil, nil, nil)
                                    
                                }){
                                    HStack{
                                        Text("Save")
                                        Image(systemName: "square.and.arrow.down")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                    }
                                }
                            }))
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            
        }
    }
}

struct UnSplashApp2PhotoList_Previews: PreviewProvider {
    static var previews: some View {
        UnSplashApp2()
    }
}
