//
//  DetailView.swift
//  News Update
//
//  Created by Damilola Okafor on 11/14/20.
//  Copyright © 2020 Damilola Okafor. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.remita.net")
    }
}

