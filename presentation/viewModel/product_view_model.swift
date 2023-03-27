
import Foundation

class ProductViewModel: ObservableObject{
//   let getProductUseCase
    enum State {
            case idle
            case loading
            case success([ProductEntity])
            case error(Failure)
        }
    @Published var state: State = .idle
    
    
    private let dependency: ProductViewModelDependency
    
    init(dependency: ProductViewModelDependency) {
        self.dependency = dependency
    }
    
    func fetchProduct(){
        state = .loading
        dependency.getProductUseCase.execute(p: EmptyParam(), completeHandle: {
            [weak self]
            result in
            DispatchQueue.main.async {
                switch result{
                case .Left(let user):
                    self?.state = .success(user)
                case .Right(let error):
                    self?.state = .error(error)
                }
            }
        })
    }
}
