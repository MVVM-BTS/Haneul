//
//  MovieListRepository.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

class MovieListRepository: MovieRepository {
    
    var movieList: [Movie] = []
    
    func fetchMovieList(request: MovieRequest, completion: @escaping ([Movie]) -> Void) {
        // TODO: 데이터 fetch
        MovieService.shared.getMovieList(param: request) { [weak self]
            result in
            switch result {
            case .success(let data):
                print("success")
                self?.movieList = data as! [Movie]
                completion(self!.movieList)
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr(_):
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
