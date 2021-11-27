import SwiftUI

final class UIViewRepresentableScrollViewController: UIViewController {
    var dataSource: DataSource = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView(rootView: UIViewRepresentableScrollView(dataSource: dataSource))
    }
}

struct UIViewRepresentableScrollView: View {
    @ObservedObject var dataSource: DataSource
    
    var body: some View {
        RepresentableScrollView(
            refreshing: dataSource.refreshing,
            onRefresh: {
                dataSource.refresh()
            }
        ) {
            VStack {
                ForEach(dataSource.nums, id: \.self) { num in
                    ItemView(num: num)
                }
            }
        }
    }
}

