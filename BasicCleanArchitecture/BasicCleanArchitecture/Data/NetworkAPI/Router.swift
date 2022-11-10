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

extension Router: BaseTargetType {
    
    var path: String {
        switch self {
        case .getMovieSearch(_):
            return URLConstant.searchURL
        }
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
            return .requestParameters(parameters: ["query":param.query],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMovieSearch:
            return NetworkConstant.header
        }
    }
    
}

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
