//
//  either.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/27/23.
//

import Foundation

enum Either<L>{
        case Left(L)
        case Right(Failure)
    
    var successValue: L? {
        switch self {
        case .Left(let value):
            return value
        case .Right:
            return nil
        }
    }

    var failureValue: Failure? {
        switch self {
        case .Left:
            return nil
        case .Right(let error):
            return error
        }
    }
}
