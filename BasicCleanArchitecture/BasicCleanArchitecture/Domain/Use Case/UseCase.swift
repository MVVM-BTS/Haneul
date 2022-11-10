//
//  UseCase.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

// TODO: Repository Interface를 통해 영화리스트 raw data fetch - 의존성 역전
protocol SearchMoviesUseCase {
    func fetchMovieList(requestValue: MovieRequest,
                        completion: @escaping ([Movie]) -> Void)
}


final class GetMovieListUseCase: SearchMoviesUseCase {
    
    private let repository: MovieRepository
    private let movieRequest: MovieRequest
    
    
    func fetchMovieList(requestValue: MovieRequest, completion: @escaping ([Movie]) -> Void) {
        // TODO: 요청
        return repository.fetchMovieList(request: requestValue) { result in
            completion(result)
        }
    }

    init(repository: MovieRepository, movieRequest: MovieRequest) {
        self.repository = repository
        self.movieRequest = movieRequest
    }
}

public protocol Cancellable {
    func cancel()
}
