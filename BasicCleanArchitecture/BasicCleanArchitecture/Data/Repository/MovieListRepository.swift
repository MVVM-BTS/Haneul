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
        
        MovieService.shared.getMovieList(param: request) {
            result in
            switch result {
            case .success(let data):
                guard let data = data as? [Movie] else { return }
                self.movieList = data
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
        completion(movieList)
    }
}
