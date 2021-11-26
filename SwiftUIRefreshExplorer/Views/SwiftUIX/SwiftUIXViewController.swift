import SwiftUI
import SwiftUIX

final class SwiftUIXViewController: UIViewController {
    var dataSource: DataSource = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView(rootView: SwiftUIXView(dataSource: dataSource))
    }
}

struct SwiftUIXView: View {
    @ObservedObject var dataSource: DataSource
    
    var body: some View {
        CocoaScrollView {
            VStack {
                ForEach(dataSource.nums, id: \.self) { num in
                    ItemView(num: num)
                }
            }
        }
        .isRefreshing(dataSource.refreshing)
        .onRefresh { dataSource.refresh() }
    }
}
