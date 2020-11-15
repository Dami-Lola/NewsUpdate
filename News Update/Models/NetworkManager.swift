//
//  NetworkManager.swift
//  News Update
//
//  Created by Damilola Okafor on 11/14/20.
//  Copyright © 2020 Damilola Okafor. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    
    @Published var posts = [Results]()
//    @Published var author = [Tags]()
    
    func fetchDate() {
        if  let url = URL(string: "https://content.guardianapis.com/search?&show-tags=contributor&api-key=165aa8ff-478e-48b3-bbfd-b34541a18064"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        
                        do{
                            let newsData =  try decoder.decode(NewsData.self, from: safeData)
//                            let tagsData =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts =  newsData.response.results
//                                self.author = tagsData.tags
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
