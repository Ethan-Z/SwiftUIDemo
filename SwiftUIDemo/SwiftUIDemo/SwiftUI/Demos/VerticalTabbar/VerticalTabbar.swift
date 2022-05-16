//
//  VerticalTabbar.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/14.
//

import SwiftUI
struct VerticalTabbar: View {
    
    @State var index = 3
    
    var body: some View {
        HStack{
            
            VStack{
                
                Button(action: {
                    
                }, label: {
                    Image("menu")
                        .resizable()
                        // 呈现方式  .original 使用原图片的像素,
                        // .template  不是透明的像素 将使用前景色进行渲染
                        .renderingMode(.original)
                        .frame(width: 22, height: 22)
                        
                })
                .padding(.top)
                // 距离顶部安全区域的高度
                .padding(.top, safeAreaInsets?.top)
                
                
                Button(action: {
                                   
                }, label: {
                    Image("search")
                        .resizable()
                        // 呈现方式  .original 使用原图片的像素,
                        // .template  不是透明的像素 将使用前景色进行渲染
                       
                        .renderingMode(.original)
                        .frame(width: 22, height: 22)
                       
                })
                .padding(.top, 30)
                
                Group{
                    
                    Button(action: {
                        self.index = 0
                    }, label: {
                        Text("My Profile")
                            .foregroundColor(self.index == 0 ? .white : .black)
                            .frame(width: 120, height: 35)
                            .background(Color("VerticalTabbarColor2").opacity(self.index == 0 ? 1 : 0))
                            .clipShape(VerticalTabbarShape2())
                    })
                    .rotationEffect(Angle(degrees: -90))
                    .padding(.top, 80)
                    
                    //使用这个来使得 各个按钮均分
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 1
                    }, label: {
                        Text("Notifications")
                            .foregroundColor(self.index == 1 ? .white : .black)
                            .frame(width: 120, height: 35)
                            .background(Color("VerticalTabbarColor2").opacity(self.index == 1 ? 1 : 0))
                            .clipShape(VerticalTabbarShape2())
                    })
                    .rotationEffect(Angle(degrees: -90))
                    
                    
                    Spacer(minLength: 0)
                        
                    Button(action: {
                        self.index = 2
                    }, label: {
                        Text("Invoice")
                            .foregroundColor(self.index == 2 ? .white : .black)
                            .frame(width: 120, height: 35)
                            .background(Color("VerticalTabbarColor2").opacity(self.index == 2 ? 1 : 0))
                            .clipShape(VerticalTabbarShape2())
                    })
                    .rotationEffect(Angle(degrees: -90))
                
                    
                    Spacer(minLength: 0)
                                                
                    Button(action: {
                        self.index = 3
                    }, label: {
                        Text("Home")
                            .foregroundColor(self.index == 3 ? .white : .black)
                            .frame(width: 120, height: 35)
                            .background(Color("VerticalTabbarColor2").opacity(self.index == 3 ? 1 : 0))
                            .clipShape(VerticalTabbarShape2())
                    })
                    .rotationEffect(Angle(degrees: -90))

                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("shop")
                            .resizable()
                            .frame(width: 25, height: 30)
                            
                    })
                    .padding(.bottom)
                    .padding(.bottom, safeAreaInsets?.bottom)
                        
                        
                }
            }
            .padding(.vertical)
            .frame(width: 86)
            .background(Color("VerticalTabbarColor1"))
            .clipShape(VerticalTabbarShape())
            
            
            GeometryReader{ _ in
                
                VStack {
                    if self.index == 0{
                        EmptyView()
                    } else if self.index == 1{
                        EmptyView()
                    } else if self.index == 2{
                        EmptyView()
                    } else if  self.index == 3 {
                        VerticalHome()
                    }else{
                        EmptyView()
                    }
                }
                .padding(.top, safeAreaInsets?.top)
                .padding(.bottom, safeAreaInsets?.bottom)
                
            }
            
            
        }
        .ignoresSafeArea(.all)
    }
}


struct VerticalTabbarShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
        
    }
}

struct VerticalTabbarShape2 : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}


struct FoodItem : Identifiable {
    
    var id : Int
    var name : String
    var cName: String
    var price : String
    var image : String
    
}


struct VerticalHome : View {
    
    @State var index = 0
    
    var foods = [
        FoodItem(id: 1, name: "Rice Stick Noodles", cName: "italian", price: "$18", image: "rice"),
        FoodItem(id: 2, name: "Mung Bean Noodles", cName: "Chainese", price: "$29", image: "bean")
    ]
    
    var body: some View {
        
        VStack{
            
            HStack {
                Text("Food & Delivery")
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
        
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        self.index = 0
                    }, label: {
                        Text("Asian")
                            .foregroundColor(self.index == 0 ? Color("VerticalTabbarColor2") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 0 ? Color.black.opacity(0.06) : .clear)
                    .clipShape(VerticalTabbarShape2())
                    
                    
                    Button(action: {
                        self.index = 1
                    }, label: {
                        Text("Chinaese")
                            .foregroundColor(self.index == 1 ? Color("VerticalTabbarColor2") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 1 ? Color.black.opacity(0.06) : .clear)
                    .clipShape(VerticalTabbarShape2())
                    
                    Button(action: {
                        self.index = 2
                    }, label: {
                        Text("Indea")
                            .foregroundColor(self.index == 2 ? Color("VerticalTabbarColor2") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 2 ? Color.black.opacity(0.06) : .clear)
                    .clipShape(VerticalTabbarShape2())
                    
                    Button(action: {
                        self.index = 3
                    }, label: {
                        Text("America")
                            .foregroundColor(self.index == 3 ? Color("VerticalTabbarColor2") : Color.black.opacity(0.7))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                    })
                    .background(self.index == 3 ? Color.black.opacity(0.06) : .clear)
                    .clipShape(VerticalTabbarShape2())
                }
                
                
            }
            .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false){
             
                HStack(spacing: 30){
                    
                    ForEach(foods){ food in
                        
                        VStack(alignment: .center){
                            
                            Image(food.image)
                                .resizable()
                                .frame(width: 125, height: 125)
                                .clipShape(Circle())
                                
                            
                            Text(food.price)
                                .foregroundColor(.blue)
                                .bold()
                                .font(.title)
                                .padding(.top, 15)
                            
                            Text(food.name)
                                .font(.body)
                                .padding(.top)
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Add")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal,18)
                                    .background(Color("VerticalTabbarColor2"))
                                    .clipShape(VerticalTabbarShape2())
                            })
                            .padding(.top, 12)
                        }
                        
                        .padding(.horizontal, 40)
                        .padding(.vertical)
                        .background(Color.black.opacity(0.05))
                        .clipShape(VerticalTabbarShape2())
                    }
                }
            }
            .padding(.top, 13)
            .padding(.horizontal, 12)
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("View All")
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                        .background(Color("VerticalTabbarColor2"))
                        .clipShape(VerticalTabbarShape2())
                        
                })
            }
            .padding(.horizontal, 20)
            
            
            
        }
        
        
    }
    
    
}



struct VerticalTabbar_Previews: PreviewProvider {
    static var previews: some View {
        VerticalTabbar()
    }
}
