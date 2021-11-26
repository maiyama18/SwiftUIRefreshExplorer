import SwiftUI
import SwiftUIPullToRefresh

final class SwiftUIPullToRefreshViewController: UIViewController {
    var dataSource: DataSource = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView(rootView: SwiftUIPullToRefreshView(dataSource: dataSource))
    }
}

struct SwiftUIPullToRefreshView: View {
    @ObservedObject var dataSource: DataSource
    
    var body: some View {
        RefreshableScrollView(onRefresh: { done in
            dataSource.refresh(completion: { done() })
        }) {
            VStack {
                ForEach(dataSource.nums, id: \.self) { num in
                    ItemView(num: num)
                }
            }
        }
    }
}
