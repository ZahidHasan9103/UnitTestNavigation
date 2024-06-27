//
//  ViewControllerTests.swift
//  TestingNavigationTests
//
//  Created by ZEUS on 27/6/24.
//

import XCTest
import ViewControllerPresentationSpy
@testable import TestingNavigation

final class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()

    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Code based push navigation
    func test_tappingCodePushButton_shouldPushCodeNextViewController(){
        let navigationController = UINavigationController(rootViewController: sut)
        
        tap(sut.codePushButton)
        
        executeRunLoop()
        XCTAssertEqual(navigationController.viewControllers.count, 2, "navigation stack")
        let pushedVC = navigationController.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else{
            XCTFail("Expected CodeNextViewController, "
            + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed From Code")
    }
    
    //MARK: - Code based modal presentation
    
    /// This is a **Not Recommended** way to test a **modally presentedViewController,**
    /// because the deInit() methods from viewController and CodeNextViewController won't get called,
    /// which is violating the clean room goals
    /*
     
     func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        
        UIApplication.shared.windows.first?.rootViewController = sut
        
        tap(sut.codeModalButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else{
            XCTFail(
                "Expexted CodeNextViewController. " +
                "but was \(String(describing: presentedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Modal from code")
        
    }
     
     */
    
    @MainActor func test_tappingCodeModalButton_shouldPresentCodeNextViewController(){
        let presentationVerifier = PresentationVerifier()
        
        tap(sut.codeModalButton)
        
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        
       // XCTAssertNotNil(codeNextVC)
       
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")

    }
    
    //MARK: - Segue-Based Push Navigation
    
    @MainActor func test_tappingSeguePushButton_shouldShowSegueNextViewController(){
        let presentationVerifier = PresentationVerifier()
        putInWindow(sut)
        
        tap(sut.seguePushButton)
        
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(
            animated: true,
            presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Pushed From Segue")
    }
    
}
