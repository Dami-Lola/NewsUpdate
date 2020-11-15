//
//  PostData.swift
//  News Update
//
//  Created by Damilola Okafor on 11/14/20.
//  Copyright © 2020 Damilola Okafor. All rights reserved.
//

import Foundation

struct NewsData: Codable {
    let response: Response
}

struct Response: Codable {
    let results: [Results]
}

struct Results: Codable, Identifiable {
//    var id: String {
//        return id
//    }
    let id: String
    let webTitle: String
    let sectionName: String
    let webPublicationDate: String
    let webUrl: String?
    let tags: [Tags]
}

struct Tags: Codable {
    let webTitle: String
}
