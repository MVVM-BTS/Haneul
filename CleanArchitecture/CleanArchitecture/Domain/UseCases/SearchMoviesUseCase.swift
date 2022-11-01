//
//  SearchMoviesUseCase.swift
//  CleanArchitecture
//
//  Created by 김하늘 on 2022/09/20.
//

import Foundation

protocol SearchMoviesUseCase {
    func execute(requestValue: SearchMoviesUseCaseRequestValue,
                 cached: @escaping (MoviesPage) -> Void,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}

final class DefaultSearchMoviesUseCase: SearchMoviesUseCase {

    // [Repository Interface]
    // Use case는 Repository Interface에 의존
    // => 변하지 않을 Repository Interface(추상적인 것)에 의존! (의존성 역전 법칙)
    private let moviesRepository: MoviesRepository
    private let moviesQueriesRepository: MoviesQueriesRepository
    
    init(moviesRepository: MoviesRepository, moviesQueriesRepository: MoviesQueriesRepository) {
        self.moviesRepository = moviesRepository
        self.moviesQueriesRepository = moviesQueriesRepository
    }
    
    func execute(requestValue: SearchMoviesUseCaseRequestValue,
                 cached: @escaping (MoviesPage) -> Void,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {

        return moviesRepository.fetchMoviesList(query: requestValue.query,
                                                page: requestValue.page,
                                                cached: cached,
                                                completion: { result in

            if case .success = result {
                // Domain layer -> Data layer로 요청
                self.moviesQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
            }

            completion(result)
        })
    }
}

// Entity
struct SearchMoviesUseCaseRequestValue {
    let query: MovieQuery
    let page: Int
}
