//
//  GeneralResponse.swift
//  BasicCleanArchitecture
//
//  Created by 김하늘 on 2022/11/01.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var lastBuildDate: String?
    var display: Int?
    var total: Int?
    var start: Int?
    var items: T?
    var message: String?
    var errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case message, lastBuildDate, total, start, display, items
        case errorCode = "error_code"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = (try? values.decode(String.self, forKey: .message)) ?? nil
        errorCode = (try? values.decode(String.self, forKey: .errorCode)) ?? nil
        lastBuildDate = (try? values.decode(String.self, forKey: .lastBuildDate)) ?? nil
        total = (try? values.decode(Int.self, forKey: .total)) ?? nil
        start = (try? values.decode(Int.self, forKey: .start)) ?? nil
        display = (try? values.decode(Int.self, forKey: .display)) ?? nil
        items = (try? values.decode(T.self, forKey: .items)) ?? nil
    }
}
