//
//  Movie.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

// TODO: 영화 객체
struct Movie: Codable {
    var title: String?
    var link: String?
    var image: String?
    var subtitle: String?
    var pubDate: String?
    var director: String?
    var actor: String?
    var userRating: String?
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, link, image, pubDate, director, actor, userRating
    }
}
