//
//  SegueNextViewController.swift
//  TestingNavigation
//
//  Created by ZEUS on 25/6/24.
//

import UIKit

class SegueNextViewController: UIViewController {
    
    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!

    deinit{
        print(">>>> SegueNextViewController.deinit")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
}
