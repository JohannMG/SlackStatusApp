//
//  OAuthWebViewViewController.swift

import UIKit


protocol OAuthSlackLoginDelegate{
    func loginDidSucceed()
    func loginFailOrDidDismiss()
}

class OAuthWebViewViewController: UINavigationController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    var loginDelegate: OAuthSlackLoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchedToDismissLogin(_ sender: UIButton) {
        dismiss(animated: true) { 
            self.loginDelegate?.loginFailOrDidDismiss()
        }
    }
    
    @IBAction func pressedDidSucceed(_ sender: Any) {
        dismiss(animated: true) { 
            self.loginDelegate?.loginDidSucceed()
        }
    }
    
    @IBAction func pressedDidFail(_ sender: Any) {
        dismiss(animated: true) {
            self.loginDelegate?.loginFailOrDidDismiss()
        }
    }

}
