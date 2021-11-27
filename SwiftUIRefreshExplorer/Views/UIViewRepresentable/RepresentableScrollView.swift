import SwiftUI
import Introspect

struct RepresentableScrollView<Content: View>: UIViewRepresentable {
    class Coordinator {
        let onRefresh: () -> Void
        
        init(onRefresh: @escaping () -> Void) {
            self.onRefresh = onRefresh
        }
        
        @objc
        func didRefresh() {
            onRefresh()
        }
    }
    
    let refreshing: Bool
    let onRefresh: () -> Void
    let customize: (UIScrollView) -> Void
    @ViewBuilder let content: () -> Content
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        
        customize(scrollView)
        
        scrollView.setupSwiftUIView(rootView: content())
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(context.coordinator, action: #selector(context.coordinator.didRefresh), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        refreshing
            ? uiView.refreshControl?.beginRefreshing()
            : uiView.refreshControl?.endRefreshing()
        
        uiView.setupSwiftUIView(rootView: content())
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onRefresh: onRefresh)
    }
}

struct RepresentableList<Content: View>: View {
    let refreshing: Bool
    let onRefresh: () -> Void
    let customize: (UIScrollView) -> Void
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        GeometryReader { proxy in
            RepresentableScrollView(refreshing: refreshing, onRefresh: onRefresh, customize: customize) {
                List {
                    content()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}
