//
//  product_reponsitort_impl.swift
//  clean architecture with mvvm demo
//
//  Created by phuc on 3/17/23.
//

import Foundation

struct ProductResponsitoryImpl: ProductRepository{
    
    
    let productMapper: ProductMapper
    
    func getListProduct(completeHandle: @escaping ((Either<[ProductEntity]>)) -> Void) {
        print("getListProduct")
        guard let url = URL(string: "https://fakestoreapi.com/products/") else {
            return
        }
        
         URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data , error  == nil else {
                return
            }
            do{
                let products = try JSONDecoder().decode([ProductResponse].self, from: data)
                let productEntities = productMapper.mapList(inpust: products)
                completeHandle(Either.Left(productEntities))
            }catch{
                completeHandle(Either.Right(UnCatchError(messgage: error.localizedDescription)))
            }
        })
         .resume()
    }
    
}
