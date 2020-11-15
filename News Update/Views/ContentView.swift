//
//  ContentView.swift
//  News Update
//
//  Created by Damilola Okafor on 11/14/20.
//  Copyright © 2020 Damilola Okafor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                
                NavigationLink(destination: DetailView(url: post.webUrl)) {
                    HStack{
                        Image("newspaper")
                            .resizable()
                            .frame(width: 75.0, height: 75.0)
                        
                        VStack{
                            
                        Text(post.webTitle)
                            .bold()
                            .font(.system(size: 14))
                            
                        Text(post.sectionName)
                            .font(.system(size: 13))
                            
                        Text(post.webPublicationDate)
                            .font(.system(size: 13))
                            
                        }
                        
                    }
                }
            }
            .navigationBarTitle("NEWS UPDATES")
        }
            
        .onAppear {
            self.networkManager.fetchDate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Post: Identifiable {
    let id: String
    let title: String
}

//    let posts = [
//        Post(id: "1", title: "Yooooo"),
//        Post(id: "2", title: "This is you"),
//        Post(id: "3", title: "I know right")
//
//    ]
