//
//  NetworkService.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/11/01.
//

import Moya

public class MovieService {
    static let shared = MovieService()
    var MovieProvider = MoyaProvider<Router>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getMovieList(param: MovieRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        MovieProvider.request(.getMovieSearch(param: param)) {
            result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = NetworkBase.judgeStatus(by: statusCode, data, [Movie].self)
                completion(networkResult)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
