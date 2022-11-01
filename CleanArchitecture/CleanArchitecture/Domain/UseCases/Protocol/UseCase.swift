//
//  UseCase.swift
//  CleanArchitecture
//
//  Created by 김하늘 on 2022/09/20.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
