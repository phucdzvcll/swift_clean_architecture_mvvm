//
//  product_mapper.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/17/23.
//

import Foundation

class ProductMapper: Mapper{
    typealias Input = ProductResponse?
    
    typealias OutPut = ProductEntity
    
    func map(i: ProductResponse?) -> ProductEntity {
        return ProductEntity.init(title: i?.title ?? "", image: i?.image ?? "")
    }
    
}
