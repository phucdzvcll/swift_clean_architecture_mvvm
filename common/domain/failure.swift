//
//  Failure.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/27/23.
//

import Foundation

protocol Failure {
    
}

struct UnCatchError: Failure {
    let messgage : String;
}

struct ServerError: Failure {
    let message: String;
    let errorCode: Int;
}

protocol FeatureError: Failure {
    
}
