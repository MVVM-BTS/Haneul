//
//  MovieResponse.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/10/04.
//

import Foundation

struct MovieResponse: Codable {
    var title: String
    var link: String
    var image: String
    var pubDate: String
    var director: String
    var actor: String
    var userRating: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, image, pubDate, director, actor, userRating
    }
}
