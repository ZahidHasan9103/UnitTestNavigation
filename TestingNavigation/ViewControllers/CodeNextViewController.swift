//
//  CodeNextViewController.swift
//  TestingNavigation
//
//  Created by ZEUS on 25/6/24.
//

import UIKit

class CodeNextViewController: UIViewController {

    let label = UILabel()
    
    init(labelText: String){
        label.text = labelText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        print(">>>> CodeNextViewController.deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        activateEqualConstraints(.centerX, fromItem: label, toItem: view)
        activateEqualConstraints(.centerY, fromItem: label, toItem: view)
    }
    
    private func activateEqualConstraints(
        _ attribute: NSLayoutConstraint.Attribute,
        fromItem: UIView,
        toItem: UIView){
            
            NSLayoutConstraint(item: fromItem,
                               attribute: attribute,
                               relatedBy: .equal,
                               toItem: toItem,
                               attribute: attribute,
                               multiplier: 1,
                               constant: 0).isActive = true
            
        }

}
