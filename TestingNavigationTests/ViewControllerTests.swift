//
//  ViewControllerTests.swift
//  TestingNavigationTests
//
//  Created by ZEUS on 27/6/24.
//

import XCTest
@testable import TestingNavigation
final class ViewControllerTests: XCTestCase {
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        let navigationController = UINavigationController(rootViewController: sut)
        
        tap(sut.codePushButton)
        
        executeRunLoop()
        XCTAssertEqual(navigationController.viewControllers.count, 2, "navigation stack")
        let pushedVC = navigationController.viewControllers.last
        
//        XCTAssertTrue(pushedVC is CodeNextViewController,
//        "Expected CodeNextViewController, "
//        + "but was \(String(describing: pushedVC))")
        
        //Or
        guard let codeNextVC = pushedVC as? CodeNextViewController else{
            XCTFail("Expected CodeNextViewController, "
            + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed From Code")
    }

}
