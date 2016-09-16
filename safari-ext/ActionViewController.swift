import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in self.extensionContext!.inputItems {
            let inputItem = item as! NSExtensionItem
            for provider in inputItem.attachments! {
                let itemProvider = provider as! NSItemProvider
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItem(forTypeIdentifier: "public.item", options: nil, completionHandler: {
                        result, _ in
                        if let url = result as? NSURL {
                            self.openURL(url: url)
                            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
                        }
                    })
                }
            }
        }
    }
    
    @IBAction func done() {
        self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
    }
    
}

