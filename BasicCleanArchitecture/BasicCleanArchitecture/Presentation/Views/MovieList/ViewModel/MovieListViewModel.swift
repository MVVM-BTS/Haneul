//
//  MovieListViewModel.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/10/04.
//

import Foundation

import RxCocoa
import RxSwift

class MovieListViewModel {
    // TODO: Use case 요청
    private let useCase: GetMovieListUseCase
    
    func fetchMovieList() {
        useCase.fetchMovieList()
    }
    
    init(useCase: GetMovieListUseCase) {
        self.useCase = useCase
    }
    
    func setInitData() -> Observable<[Movie]> {
        return Observable.create { [weak self] observer in
            let initQuery = "가"
            let request = MovieRequest(query: initQuery)
            
            self?.searchUseCase.fetchMovieList(requestValue: request) { result in
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create() {}
        }
        
    }
    
}
