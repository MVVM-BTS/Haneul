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
    
    // MARK: - Property
    private let searchUseCase: SearchMoviesUseCase
    
    var requestQuery: String = ""
    
    init(searchUseCase: SearchMoviesUseCase) {
        self.searchUseCase = searchUseCase
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
