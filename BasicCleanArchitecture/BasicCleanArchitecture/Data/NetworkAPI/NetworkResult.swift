//
//  NetworkResult.swift
//  BasicCleanArchitecture
//
//  Created by κΉνλ on 2022/11/01.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr(T)
    case networkFail
}
