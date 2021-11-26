import SwiftUI
import SwiftUIRefresh

final class SwiftUIRefreshViewController: UIViewController {
    var dataSource: DataSource = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView(rootView: SwiftUIRefreshView(dataSource: dataSource))
    }
}

struct SwiftUIRefreshView: View {
    @ObservedObject var dataSource: DataSource
    
    var body: some View {
        List {
            ForEach(dataSource.nums, id: \.self) { num in
                ItemView(num: num)
            }
        }
        .listStyle(.plain)
        .pullToRefresh(isShowing: $dataSource.refreshing) {
            dataSource.refresh()
        }
    }
}
