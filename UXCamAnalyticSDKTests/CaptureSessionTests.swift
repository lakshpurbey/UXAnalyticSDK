//
//  CaptureSessionTests.swift
//  UXCamAnalyticSDKTests
//
//  Created by HAR-LAP046-080 on 16/04/2024.
//

import XCTest

@testable import UXCamAnalyticSDK

class CaptureSessionTests: XCTestCase {
        
    var captureSession: CaptureSession!
    var mockDelegate: MockCaptureDelegate!
    
    override func setUp() {
        super.setUp()
        captureSession = CaptureSession() // Instantiate CaptureSession
        mockDelegate = MockCaptureDelegate()
    }
    
    override func tearDown() {
        captureSession = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testSessionDidStart() {
        
        captureSession.sessionDidStart()
    }
        
}

class MockCaptureDelegate: SessionDelegate {
    var sessionDidStartCalled = false
    var setupSessionCalled = false
    
    func sessionDidStart() {
        sessionDidStartCalled = true
    }
    
    func sessionDidStop() {
        // Implement if needed
    }
    
    func sessionDidFailToStartWithError(_ error: Error) {
        // Implement if needed
    }
    
    func sessionDidFailToStopWithError(_ error: Error) {
        // Implement if needed
    }
}
