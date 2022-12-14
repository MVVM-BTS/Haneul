//
//  NetworkBase.swift
//  BasicCleanArchitecture
//
//  Created by κΉνλ on 2022/11/01.
//

import Foundation

struct NetworkBase {
    
    static func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ t: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<T>.self, from: data)
        else { return .pathErr }
        switch statusCode {
        case 200:
            return .success(decodedData.items)
        case 201..<300:
            return .success(decodedData.items)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr(decodedData.message)
        default:
            return .networkFail
        }
    }
}
