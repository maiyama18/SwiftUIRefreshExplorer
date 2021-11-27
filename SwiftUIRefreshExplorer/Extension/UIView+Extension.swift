import SwiftUI

extension UIView {
    func setupSwiftUIView<RootView: View>(rootView: RootView) {
        let hostingViewController = UIHostingController(rootView: rootView)
        addSubview(hostingViewController.view)
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hostingViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        hostingViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        hostingViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
