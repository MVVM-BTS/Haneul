//
//  UseCase.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

protocol SearchMoviesUseCase {
    func fetchMovieList(requestValue: MovieRequest,
                        completion: @escaping ([Movie]) -> Void)
}

final class GetMovieListUseCase: SearchMoviesUseCase {
    
    private let repository: MovieRepository
    private let movieRequest: MovieRequest
    
    // 3. repository interface를 사용하여 데이터 요청(의존성 역전)
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
