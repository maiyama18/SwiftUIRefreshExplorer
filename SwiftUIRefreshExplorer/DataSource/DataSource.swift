import Foundation
import Combine

class DataSource: ObservableObject {
    @Published var refreshing = false
    @Published var nums = Array(1...30)
    
    func refresh(completion: (() -> Void)? = nil) {
        refreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nums.shuffle()
            self.refreshing = false
            
            completion?()
        }
    }
}
