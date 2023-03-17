
import Foundation

protocol Mapper{
    associatedtype Input
    associatedtype OutPut
    
    func map(i: Input) -> OutPut
}

extension Mapper{
    func mapList(inpust: [Input]) -> [OutPut]{
        var outPuts : [OutPut] = []
        inpust.forEach{i in
            outPuts.append(map(i: i))
        }
        return outPuts
    }
}
