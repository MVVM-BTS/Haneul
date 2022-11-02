//
//  MovieRequest.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/10/11.
//

import Foundation

struct MovieRequest: Codable {
    var query: String
    var display: Int?
    var start: Int?
    var genre: String?
    var country: String?
    var yearfrom: Int?
    var yearto: Int?
    
    enum CodingKeys: String, CodingKey {
        case query, display, start, genre, country, yearfrom, yearto
    }
}
