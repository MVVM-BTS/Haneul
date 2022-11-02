//
//  GeneralResponse.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/11/01.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var errorMessage: String?
    var errorCode: String?
    var lastBuildDate: String?
    var total: Int?
    var start: Int?
    var display: Int?
    var items: T?
    
    enum CodingKeys: String, CodingKey {
        case errorMessage, errorCode, lastBuildDate, total, start, display, items
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorMessage = (try? values.decode(String.self, forKey: .errorMessage)) ?? ""
        errorCode = (try? values.decode(String.self, forKey: .errorCode)) ?? ""
        lastBuildDate = (try? values.decode(String.self, forKey: .lastBuildDate)) ?? ""
        total = (try? values.decode(Int.self, forKey: .total)) ?? 0
        start = (try? values.decode(Int.self, forKey: .start)) ?? 0
        display = (try? values.decode(Int.self, forKey: .display)) ?? 0
        items = (try? values.decode(T.self, forKey: .display)) ?? nil
    }
}
