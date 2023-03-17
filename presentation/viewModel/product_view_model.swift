
import Foundation

class ProductViewModel: ObservableObject{
//   let getProductUseCase
    enum State {
            case idle
            case loading
            case success([ProductEntity])
            case error
        }
    @Published var state: State = .idle
    
    
    private let dependency: ProductViewModelDependency
    
    init(dependency: ProductViewModelDependency) {
        self.dependency = dependency
    }
    
    func fetchProduct(){
        state = .loading
        print(" fetchProduct ")
        dependency.getProductUseCase.execute(p: EmptyParam(), completeHandle: {[weak self]
            result in
            DispatchQueue.main.async {
                self?.state = .success(result)
            }
        })
    }
}
