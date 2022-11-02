//
//  NetworkBase.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/11/01.
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
            return .requestErr(decodedData.errorMessage)
        case 500:
            return .serverErr(decodedData.errorMessage)
        default:
            return .networkFail
        }
    }
}
