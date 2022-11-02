//
//  Router.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/10/11.
//

import Foundation

import Moya

enum Router {
    case getMovieSearch(param: MovieRequest)
}

extension Router: TargetType {
    
    var path: String {
        switch self {
        case .getMovieSearch(_):
            return "\(URLConstant.baseURL)/"
        }
    }
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieSearch:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMovieSearch(let param):
            return .requestParameters(parameters: ["query":param.query,
                                                   "display": param.display as Any,
                                                   "start": param.start as Any,
                                                   "genre": param.genre as Any,
                                                   "country": param.country as Any,
                                                   "yearfrom": param.country as Any,
                                                   "yearto": param.yearto as Any],
                                      encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMovieSearch:
            return NetworkConstant.header
        }
    }
    
}
