//
//  UseCase.swift
//  CleanArchitecture
//
//  Created by κΉνλ on 2022/09/20.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
