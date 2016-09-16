import UIKit

extension UIViewController {
    
    func openURL(url: NSURL) {
        do {
            let application = try self.sharedApplication()
            application.performSelector(inBackground: "openURL:", with: url)
        }
        catch {
            
        }
    }
    
    func sharedApplication() throws -> UIApplication {
        var responder: UIResponder? = self
        while responder != nil {
            if let application = responder as? UIApplication {
                return application
            }
            
            responder = responder?.next
        }
        
        throw NSError(domain: "UIInputViewController+sharedApplication.swift", code: 1, userInfo: nil)
    }
    
}
