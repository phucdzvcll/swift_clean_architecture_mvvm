//
//  di.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/17/23.
//

import Foundation

protocol ProductViewModelDependency{
    var getProductUseCase: GetProductUseCase { get }
}

class ProductViewModelDependencyDefault: ProductViewModelDependency{
    var getProductUseCase: GetProductUseCase
    init() {
        let dependenct  = GetProductUseCaseDependencyDefault()
        self.getProductUseCase = GetProductUseCase(productRepository: dependenct.productRepository)
    }
}
