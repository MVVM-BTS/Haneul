//
//  Movie.swift
//  CleanArchitecture
//
//  Created by 김하늘 on 2022/09/20.
//

import Foundation

struct Movie: Equatable, Identifiable {
    typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    // Movie 객체르 구분하기 위한 id
    let id: Identifier
    let title: String?
    let genre: Genre?
    let posterPath: String?
    let overview: String?
    let releaseDate: Date?
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}
