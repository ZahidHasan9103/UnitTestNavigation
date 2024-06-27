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
