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
    
    func fetchMovieList() ->  {
        repository.fetchMovieList()
    }
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
}
