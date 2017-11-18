//
//  Movie.swift
//  FlixV2
//
//  Created by Madel Asistio on 11/17/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var posterURL: URL
    var overview: String
    
    init(title: String, posterURL: URL, overview: String) {
        self.title = title
        self.posterURL = posterURL
        self.overview = overview
    }
    
}
