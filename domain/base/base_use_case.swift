import Foundation

protocol BaseUseCase{
    associatedtype Param: UseCaseParam
    associatedtype Result
    
    func execute(p: Param, completeHandle: @escaping (Either<Result>) -> Void)
}
