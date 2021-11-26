import SwiftUI
import SwiftUIX

final class SwiftUIXViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView(rootView: SwiftUIXView())
    }
}

struct SwiftUIXView: View {
    @State var dataSource: DataSource = .init()
    
    var body: some View {
        CocoaScrollView {
            LazyVStack {
                ForEach(dataSource.nums, id: \.self) { num in
                    Text("Item #\(num)")
                        .padding()
                        .frame(height: 44)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
