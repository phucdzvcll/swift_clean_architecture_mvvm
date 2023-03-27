//
//  get_product_use_case.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/17/23.
//

import Foundation

struct GetProductUseCase: BaseUseCase{
    
    let productRepository: ProductRepository
    
    
    func execute(p: EmptyParam, completeHandle: @escaping (Either<[ProductEntity]>) -> Void) {
        productRepository.getListProduct(completeHandle: completeHandle)
    }
    
    typealias Param = EmptyParam
    
    typealias Result = [ProductEntity]
    
}
