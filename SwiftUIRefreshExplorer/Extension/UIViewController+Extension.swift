import SwiftUI

extension UIViewController {
    func setupSwiftUIView<RootView: View>(rootView: RootView) {
        let hostingViewController = UIHostingController(rootView: rootView)
        addChild(hostingViewController)
        view.addSubview(hostingViewController.view)
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
