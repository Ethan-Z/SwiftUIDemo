//
//  UnSplashApp.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/15.
//

import SwiftUI
import SDWebImageSwiftUI


struct UnSplashApp: View {
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    @State var expland = false
    @State var search = ""
    @ObservedObject var model = UnSplashAppViewModel()
    @State var searching = false
    
    var body: some View {
        VStack(spacing: 0){
            
            HStack{
                Button(action: {
                    presentMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .frame(width: 23, height: 23)

                }
                
                if !expland {
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Unspalsh")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Beautiful, Free Photos")
                            .font(.callout)
                         
                    }
                    .foregroundColor(.black)
                }
                
                
                Spacer(minLength: 0)
                
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        // 隐私动画, 将值包围. 有用到该属性的将有这个动画
                        withAnimation {
                            self.expland = true
                        }
                    }
                
                if expland {
                    TextField("Search...", text: self.$search)
                    if self.search != "" {
                        Text("Find")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .onTapGesture {
                                
                                self.searching = true
                                self.model.page = 1
                                self.model.requestSeatchDatas(search: self.search)
                            }
                    }
                    
                    // 关闭按钮
                    Button(action: {
                        withAnimation {
                            self.expland = false
                        }
                        
                        self.search = ""
                        if self.searching {
                            self.searching = false
                            self.model.requestDatas()
                        }
                        
                       
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                    }
                }

                
            }
            .padding(.top, windowsSafeAreaInsets?.top)
            .padding()
            .background(Color.white)
            
            
            if self.model.images.isEmpty {
                
                // 加载中 或者没有数据
                // 或者 没有数据
                Spacer()
                if self.model.emptyData {
                    Text("empty datas")
                }else{
                    Indicator()
                }
                Spacer()
                
            }else{
                Spacer()
              
                ScrollView(.vertical, showsIndicators: false){
                    // 列表视图
                    VStack(spacing: 10){
                        ForEach(self.model.images, id: \.self){ imageModels in
                            HStack(spacing: 15){
                                ForEach(imageModels) { imageModel in
                                    AnimatedImage(url: URL(string: imageModel.urls["thumb"]!))
                                        .resizable()
                                        .frame(width: (UIScreen.main.bounds.width - 50)/2, height: 200)
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(15)
                                    
                                        .contextMenu(menuItems: {
                                            // 下载按钮
                                            Button(action: {
                                                self.model.saveToPhoto(url: imageModel.urls["thumb"])
                                            }, label: {
                                                HStack{
                                                    Text("Save")
                                                    Spacer()
                                                    Image(systemName: "square.and.arrow.down.fill")
                                                    
                                                }
                                            })
 
                                        })
  
                                }
                            }
                            
                        }
  
                    }
                    .padding(.top)
                    // 翻页控件
                    HStack{
                        if self.searching && self.search != "" {
                            Text("page \(self.model.page)")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Button(action: {
                            if self.search != "" {
                                self.model.page += 1
                                self.model.requestSeatchDatas(search: self.search)
                            }else{
                                self.model.requestDatas()
                            }
                            
                        }){
                            Text("Next")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
        }
        .navigationBarHidden(true)
        // 背景需要设置颜色需要全覆盖
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: {
            model.requestDatas()
        })
        
   
    }
}

class UnSplashAppViewModel : ObservableObject {
    
    @Published var images : [[UnSplashAppPhotoModel]] = []
    @Published var emptyData = false
    var page = 0
    let key = "6lWYlocE-Fsx1PsbN9jRSoslq1CJCiSVhXaXWJybgFw"
    let host = "https://api.unsplash.com"
    
    

    func requestDatas(){
        
        self.images.removeAll()
        let url = "\(host)/photos/random/?client_id=\(key)&count=10"
        print(url)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, _, err in
            
            if err != nil {
                print(err?.localizedDescription ?? "network error")
                return
            }
            
            //json deconding
            
            do{
                let json = try  JSONDecoder().decode([UnSplashAppPhotoModel].self, from: data!)
                DispatchQueue.main.async {
                    self.emptyData = json.count <= 0
                }
                
                
                
                for i in stride(from: 0, to: json.count, by: 2){
                    var array =  [UnSplashAppPhotoModel]()
                    
                    for j in i..<i+2 {
                        array.append(json[j])
                    }
                    DispatchQueue.main.async {
                        self.images.append(array)
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }

        }.resume()
        
        
        
    }
    
    func requestSeatchDatas(search: String){
        self.images.removeAll()
        let url = "\(host)/search/photos/?client_id=\(key)&page=\(page)&query=\(search)"
        let session = URLSession(configuration: .default)
        print(url)
        session.dataTask(with: URL(string: url)!) { data, _, err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            do{
                let json = try JSONDecoder().decode(UnSplashAppPhotoSearchModel.self, from: data!)
                let result =  json.results
                DispatchQueue.main.async {
                    self.emptyData = result.count <= 0
                }
              
                for i in stride(from: 0, to: result.count, by: 2){
                    
                    var array =  [UnSplashAppPhotoModel]()
                    for j in i..<i+2 {
                        array.append(result[j])
                    }
                    DispatchQueue.main.async {
                        self.images.append(array)
                    }
                }
                
            }catch{
                
                print(error.localizedDescription)
            }

        }.resume()
        
    }
    
    func saveToPhoto(url: String?){
        
        guard let url = url else {
            return
        }
        
        SDWebImageDownloader().downloadImage(with: URL(string: url)) { image, _, _, _ in
            
            guard let image = image else {
                return
            }
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
        }
        
        
    }
    
    
}


struct UnSplashAppPhotoModel : Identifiable, Decodable, Hashable{
    
    var id : String
    var urls : [String : String]
}

struct  UnSplashAppPhotoSearchModel : Decodable {
    var results : [UnSplashAppPhotoModel]
}




struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
    
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
    
}



struct UnSplashApp_Previews: PreviewProvider {
    static var previews: some View {
        UnSplashApp()
    }
}
