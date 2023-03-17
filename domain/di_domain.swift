import Foundation

protocol GetProductUseCaseDependency{
    var productRepository: ProductRepository { get }
}

class GetProductUseCaseDependencyDefault: GetProductUseCaseDependency{
    var productRepository: ProductRepository
    init() {
        self.productRepository = ProductResponsitoryImpl(productMapper: ProductMapper())
    }
}
