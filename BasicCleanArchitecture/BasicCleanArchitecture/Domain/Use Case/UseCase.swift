//
//  UseCase.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

// TODO: Repository Interface를 통해 영화리스트 raw data fetch - 의존성 역전
class GetMovieListUseCase {
    
    private var repository: MovieRepository
    private var movieRequest: MovieRequest
    public var movieList: [Movie] = []
    
    func fetchMovieList() -> [Movie] {
        // TODO: 요청 쿼리 작성
        
        // TODO: 요청
        repository.fetchMovieList(request: movieRequest) { [weak self]
            result in
            self?.movieList = result
        }
        return movieList
    }
    
    init(repository: MovieRepository, movieRequest: MovieRequest) {
        self.repository = repository
        self.movieRequest = movieRequest
    }
}
