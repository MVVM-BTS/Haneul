//
//  RepositoryInterFace.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/09/27.
//

import Foundation

// TODO: 네트워크 요청 Interface 작성
protocol MovieRepository {
    func fetchMovieList(request: MovieRequest, completion: @escaping ([Movie]) -> Void)
}
