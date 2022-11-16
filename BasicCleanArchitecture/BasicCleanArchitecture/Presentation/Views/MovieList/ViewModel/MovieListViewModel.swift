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
    private var requestQuery: String = ""
    
    init(searchUseCase: SearchMoviesUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    // 2. 호출되면 use case interface를 통해(클린 아키텍처에서 필수적이진 않음) use case 내 기능 호출
    // 받아온 데이터를 뷰에서 비동기적으로 처리하기 위해 데이터를 Observable로 넘겨줌
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
    
    func setSearchData(text: String) -> Observable<[Movie]> {
        return Observable.create { [weak self] observer in
            let initQuery = text
            let request = MovieRequest(query: initQuery)
            
            self?.searchUseCase.fetchMovieList(requestValue: request) { result in
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create() {}
        }
    }
}
