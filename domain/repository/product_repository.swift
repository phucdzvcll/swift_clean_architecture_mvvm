//
//  product_repository.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/17/23.
//

import Foundation

protocol ProductRepository {
    func getListProduct(completeHandle: @escaping (Either<[ProductEntity]>)->Void)
}
