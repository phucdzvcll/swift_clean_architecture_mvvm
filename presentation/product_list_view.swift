import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductViewModel = ProductViewModel(dependency: ProductViewModelDependencyDefault())
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .idle:
                ProgressView()
            case .success(let result):
                List{
                    ForEach(result, id: \.title){
                        product in
                        HStack{
                            Image("")
                                .frame(width: 130, height: 70)
                            Text(product.title)
                                .bold()
                        }
                    }
                }
            case .error(let error):
                if(error is UnCatchError){
                    Text("UnCatchError!")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }else if(error is ServerError){
                    Text("ServerError!")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }else {
                    Text("Some thing went wrong!")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
        }.onAppear{
            viewModel.fetchProduct()
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
