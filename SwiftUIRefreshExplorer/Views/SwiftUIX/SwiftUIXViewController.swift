import SwiftUI
import SwiftUIX

final class SwiftUIXViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingViewController = UIHostingController(rootView: SwiftUIXView())
        addChild(hostingViewController)
        view.addSubview(hostingViewController.view)
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
