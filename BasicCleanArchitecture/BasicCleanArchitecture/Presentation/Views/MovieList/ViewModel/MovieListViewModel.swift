//
//  MovieListViewModel.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/10/04.
//

import Foundation

class MovieListViewModel {
    // TODO: Use case 요청
    private let useCase: GetMovieListUseCase
    
    func fetchMovieList() {
        useCase.fetchMovieList()
    }
    
    init(useCase: GetMovieListUseCase) {
        self.useCase = useCase
    }
    
    
}
