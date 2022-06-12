//
//  TravelAppUI.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/19.
//

import SwiftUI

struct TravelAppUI: View {
    
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    
    @State var data = [

        TravelData(id: 0, image: "yosemite", country: "USA", place: "Yosemite", details: "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome. In Yosemite Village are shops, restaurants, lodging, "),
        
        TravelData(id: 1, image: "antelope", country: "Arizona", place: "Antelope Canyon", details: "Antelope Canyon is a slot canyon in the American Southwest, on Navajo land east of Page, Arizona. It includes two separate, scenic slot canyon sections, referred to as Upper Antelope Canyon, and Lower Antelope Canyon."),
        
        TravelData(id: 2, image: "azores", country: "Portugal", place: "Azores", details: "The Azores, an autonomous region of Portugal, are an archipelago in the mid-Atlantic. The islands are characterized by dramatic landscapes, fishing villages, green pastures and hedgerows of blue hydrangeas. São Miguel, the largest, has lake-filled calderas and the Gorreana "),
        
        TravelData(id: 3, image: "venice", country: "Italy", place: "Venice", details: "Venice, the capital of northern Italy’s Veneto region, is built on more than 100 small islands in a lagoon in the Adriatic Sea. It has no roads, just canals – including the Grand Canal thoroughfare – lined with Renaissance and Gothic palaces."),
        
        TravelData(id: 4, image: "angelfalls", country: "Venezuela", place: "Angel Falls", details: "Angel Falls is a waterfall in Venezuela. It is the world's highest uninterrupted waterfall, with a height of 979 metres and a plunge of 807 m. The waterfall drops over the edge of the Auyán-tepui mountain in the Canaima National Park")

    ]
    @State var show = false
    @State var page = 0
    
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        presentMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                            .frame(width: 23, height: 23)

                    }
                    
                    Text("Travel")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("\(page + 1)/\(data.count)")
                        .foregroundColor(.gray)
                    
                }
                .padding(.top, windowsSafeAreaInsets?.top)
                .padding()
                
                GeometryReader{ g in
                    Carousel(data: $data, show: $show, index: $page, size: g.frame(in: .global))
                }
                .padding(.bottom, windowsSafeAreaInsets!.bottom + 10.0)
                
            }
            .opacity(show ? 0 : 1)
            
            
            TravelAppUIExpendView(show: $show, detail: $data[self.page])
                .scaleEffect(show ? 1 : 0)
                .frame(width: show ? nil : 0, height: show ? nil : 0)
                
            
            
            
        }
        .background(Color.gray.opacity(0.07).ignoresSafeArea(.all))
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct Carousel : UIViewRepresentable {
    
    @Binding var data : [TravelData]
    @Binding var show : Bool
    @Binding var index : Int
    let size : CGRect
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        scrollView.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
        
        let child = UIHostingController(rootView: HScrllowView(data: $data, show: $show, size: size))
        child.view.backgroundColor = .clear
        child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        
    
        scrollView.addSubview(child.view)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        //设置代理
        scrollView.delegate = context.coordinator
        
        return scrollView
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // 动态更新数据
        
        for i in  0..<uiView.subviews.count {
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        }
        
        uiView.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
        
    }
    
    // 设置代理..
    
    func makeCoordinator() -> ScrollCoordinator {
        return Carousel.ScrollCoordinator(parent: self)
    }
    
    
    class ScrollCoordinator: NSObject, UIScrollViewDelegate {
        
        let parent : Carousel
        
        init(parent: Carousel){
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let index =  Int(scrollView.contentOffset.x/scrollView.frame.size.width)
            parent.index = index
            
        }
        
        
    }
    
    
}


struct HScrllowView : View {
    
    @Binding var data : [TravelData]
    @Binding var show : Bool
    var size : CGRect
    

    var body: some View{
        
        HStack(spacing: 0){
            ForEach(data) { item in
                
                ZStack(alignment: .bottom){
                    Image(item.image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: self.size.width - 30, height: self.size.height)
                        .cornerRadius(25)
                        .contentShape(Rectangle())
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(item.place)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 25, weight: .bold))
                            
                            Text(item.country)
                                .foregroundColor(.white)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text("5")
                        }

                        Text(item.details)
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
                    
                    
                }.frame(width: self.size.width, height: self.size.height)
                .onTapGesture {
                    
                
                    
                    withAnimation {
                        self.show.toggle()
                    }
                }
            }
        }
    }
        
}





struct TravelAppUIExpendView : View {
    
    @Binding var show : Bool
    @Binding var detail : TravelData
    
    
    var body: some View {
        
        VStack{
            
            ZStack(alignment: .topTrailing){
                Image(detail.image)
                    .resizable()
//                    .frame(width: UIScreen.main.bounds.width, height: 250)
//                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                
                    
                
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                    }
                    
                }){
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.83))
                        .clipShape(Circle())
                }
                .padding(.top, windowsSafeAreaInsets?.top)
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 12){
                
                Text(detail.place)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                HStack(spacing: 12){
                    
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(detail.country)
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("5")
                }

                Text(detail.details)
                
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 25)
            .foregroundColor(.black)
            
            HStack{
                
                Text("$450")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                
                Text("(3 Days)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                Spacer()
                
                Button(action: {
                    
                }){
                    Text("Book Now")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }
                .padding(.vertical, 25)
                .frame(width: UIScreen.main.bounds.width / 2.5)
                .background(Color.blue)
                .clipShape(TravelAppShape())
    
            }
        }
        
        .ignoresSafeArea(.all)
        
        
    }

    
}





struct TravelData : Identifiable {
    
    var id: Int
    var image: String
    var country : String
    var place: String
    var details : String
}


struct TravelAppShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
    
}


struct TravelAppUI_Previews: PreviewProvider {
    static var previews: some View {
        TravelAppUI()
    }
}
