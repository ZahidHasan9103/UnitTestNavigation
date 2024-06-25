

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var codePushButton: UIButton!
    @IBOutlet private(set) var codeModalButton: UIButton!
    @IBOutlet private(set) var seguePushButton: UIButton!
    @IBOutlet private(set) var segueModalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func pushNextViewController(){
        let nextVC = CodeNextViewController(labelText: "Pushed From Code")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func presentModalNextViewController(){
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        self.present(nextVC, animated: true)
    }
}

