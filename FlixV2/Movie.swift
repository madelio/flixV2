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
    var posterURL: URL?
    var overview: String
    var backdropURL: URL?
    var releaseDate: String
    
    init(_ title: String, _ posterURL: URL, _ overview: String, _ backdropURL: URL, _ releaseDate: String) {
        self.title = title
        self.posterURL = posterURL
        self.overview = overview
        self.backdropURL = backdropURL
        self.releaseDate = releaseDate
    }
    
    init() {
        self.title = ""
        self.overview = ""
        self.releaseDate = ""
    }
    
}
