//
//  TestHelpers.swift
//  TestingNavigationTests
//
//  Created by ZEUS on 27/6/24.
//

import UIKit

func tap(_ button: UIButton){
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop(){
    RunLoop.current.run(until: Date())
}

func putInWindow(_ vc: UIViewController){
    let window = UIWindow()
    window.rootViewController = vc
    window.isHidden = false
}
