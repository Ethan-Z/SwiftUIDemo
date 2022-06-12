//
//  Tiktok.swift
//  SwiftUIDemo
//
//  Created by EthanZ on 2022/6/1.
//

import SwiftUI
import AVKit

class TiktokHost : UIHostingController<Tiktok>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

struct Tiktok: View {
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    @State var topIndex = 0
    @State var tabIndex = 0
    @State var datas = [
        TiktokVideo(id: "1", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: ".mp4")!)), isReplay: false),
        TiktokVideo(id: "2", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: ".mp4")!)), isReplay: false),
        TiktokVideo(id: "3", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: ".mp4")!)), isReplay: false),
        TiktokVideo(id: "4", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: ".mp4")!)), isReplay: false),
        TiktokVideo(id: "5", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: ".mp4")!)), isReplay: false),
        TiktokVideo(id: "6", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: ".mp4")!)), isReplay: false)
    ]
    
    var body: some View {
     
        
        ZStack{
            
            PlayerScrollView(datas: self.$datas)
            
            
            VStack{
                
                HStack(spacing: 15) {
                        
                    Button {
                        topIndex = 0
                    } label: {
                        Text("Following")
                            .foregroundColor(.white.opacity(topIndex == 0 ? 1 : 0.4))
                            .fontWeight(topIndex == 0 ? .bold : .none)
                    }
                    
                 

                    Button {
                        topIndex = 1
                        presentMode.wrappedValue.dismiss()
                    } label: {
                        Text("For You")
                            .foregroundColor(.white.opacity(topIndex == 1 ? 1 : 0.4) )
                            .fontWeight(topIndex == 1 ? .bold : .none)
                    }

                }
          
                Spacer()
                HStack{
                    Spacer()
                    VStack(spacing: 20) {
                        Image("a31")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Button {
                            
                        } label: {
                            VStack{
                                Image(systemName: "suit.heart.fill")
                                    .resizable()
                                    .frame(width: 30 , height: 30)
                                
                                Text("23K")
                            }.foregroundColor(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            VStack{
                                Image(systemName: "message.fill")
                                    .resizable()
                                    .frame(width: 30 , height: 30)
                                
                                Text("1381")
                            }.foregroundColor(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            VStack{
                                Image(systemName: "arrowshape.turn.up.forward.fill")
                                    .resizable()
                                    .frame(width: 30 , height: 30)
                                
                                Text("Share")
                            }.foregroundColor(.white)
                        }

                        
                    }
                }
                .padding(.bottom,40)
                .padding(.trailing)
            
                
                HStack{
                
                    Button {
                        tabIndex = 0
                    } label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 30 , height: 30)
                            .foregroundColor(.white.opacity(tabIndex == 0 ? 1 : 0.4))
                    }
                    Spacer(minLength: 0)
                    Button {
                        tabIndex = 1
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30 , height: 30)
                            .foregroundColor(.white.opacity(tabIndex == 1 ? 1 : 0.4))
                    }
                    Spacer(minLength: 0)
                    Button {
                        
                    } label: {
                        Image("upload")
                            .resizable()
                            .frame(width: 50 , height: 35)
                            .foregroundColor(.white.opacity(tabIndex == 0 ? 1 : 0.4))
                    }
                    Spacer(minLength: 0)
                    
                    Button {
                        tabIndex = 3
                    } label: {
                        Image(systemName: "ellipsis.bubble")
                            .resizable()
                            .frame(width: 30 , height: 30)
                            .foregroundColor(.white.opacity(tabIndex == 3 ? 1 : 0.4))
                            
                    }

                    Spacer(minLength: 0)
                    Button {
                        tabIndex = 4
                    } label: {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30 , height: 30)
                            .foregroundColor(.white.opacity(tabIndex == 4 ? 1 : 0.4))
                    }
                    
                  
                }.padding(.horizontal)
  
            }
            .padding(.top, (windowsSafeAreaInsets?.top ?? 0) )
            .padding(.bottom, (windowsSafeAreaInsets?.bottom ?? 0) + 0 )
     
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}


struct TiktokVideoViews : View{
   
    @Binding var datas : [TiktokVideo]
    
    var body: some View {
        
        VStack{
            ForEach(0..<datas.count){ i in
                ZStack{
                    Tiktokplayer(player: self.datas[i].player)
                        .frame(width: UIScreen.main
                                .bounds.width, height: UIScreen.main.bounds.height)

                    
                    if self.datas[i].isReplay {
                        
                        Button {
                            self.datas[i].player.seek(to: .zero)
                            self.datas[i].player.play()
                            self.datas[i].isReplay = false
                            
                            
                        } label: {
                            Image(systemName: "goforward")
                            .resizable()
                            .frame(width: 55, height: 60)
                            .foregroundColor(.white)
                        }

                        
                    }
                }
            }
        }.onAppear{
            self.datas[0].player.play()
            self.datas[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.datas[0].player.currentItem, queue: .main) { _ in
                self.datas[0].player.play()
            }
        }
            
     
        
        
    }
    
}

struct TiktokVideo {
        
    var id : String
    var player : AVPlayer
    var isReplay : Bool
}


struct Tiktokplayer : UIViewControllerRepresentable {
    
    var player : AVPlayer
  
    
    func makeUIViewController(context: Context) ->  AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

struct PlayerScrollView : UIViewRepresentable {
    
    @Binding var datas : [TiktokVideo]
    
    
    func makeCoordinator() -> UIScrollViewDelegate {
        return ScrollCoordinator(parent1: self)
    }

    
    func makeUIView(context: Context) ->  UIScrollView {
        
        let scrollView = UIScrollView()
        
        
        let childView = UIHostingController(rootView: TiktokVideoViews(datas: self.$datas))
       
    
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(datas.count))
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(datas.count))
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.addSubview(childView.view)
        
        scrollView.isPagingEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = context.coordinator
      
        return scrollView
        
        
        
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((datas.count)))
        
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((datas.count)))
        }
    }
    
    
    class ScrollCoordinator : NSObject, UIScrollViewDelegate {
        
        var parent : PlayerScrollView
        var index = 0
        
        init(parent1 : PlayerScrollView) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currenrindex{
                
                index = currenrindex
                
                for i in 0..<parent.datas.count{
                    
                    // pausing all other videos...
                    parent.datas[i].player.seek(to: .zero)
                    parent.datas[i].player.pause()
                }
                
                // playing next video...
                
                parent.datas[index].player.play()
                
                parent.datas[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.datas[index].player.currentItem, queue: .main) { (_) in
                    
                    // notification to identify at the end of the video...
                    
                    // enabling replay button....
                    self.parent.datas[self.index].isReplay = true
                }
            
            }
        }
    
    }
}


struct Tiktok_Previews: PreviewProvider {
    static var previews: some View {
        Tiktok()
            .previewDevice("iPhone 13")
    }
}
