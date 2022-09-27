//
//  MoviesQueriesRepository.swift
//  CleanArchitecture
//
//  Created by 김하늘 on 2022/09/20.
//

import Foundation

protocol MoviesQueriesRepository {
    func fetchRecentsQueries(maxCount: Int, completion: @escaping (Result<[MovieQuery], Error>) -> Void)
    func saveRecentQuery(query: MovieQuery, completion: @escaping (Result<MovieQuery, Error>) -> Void)
}
