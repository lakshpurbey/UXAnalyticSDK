//
//  CaptureSessionTests.swift
//  UXCamAnalyticSDKTests
//
//  Created by HAR-LAP046-080 on 16/04/2024.
//

import XCTest

@testable import UXCamAnalyticSDK

public class CaptureSessionTests: XCTestCase {
        
    var captureSession: CaptureSession!
    var mockDelegate: MockCaptureDelegate!
    
    public override func setUp() {
        super.setUp()
        captureSession = CaptureSession() // Instantiate CaptureSession
        mockDelegate = MockCaptureDelegate()
    }
    
    public override func tearDown() {
        captureSession = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    public func testSessionDidStart() {
        
        captureSession.sessionDidStart()
    }
        
}

public class MockCaptureDelegate: SessionDelegate {
    var sessionDidStartCalled = false
    var setupSessionCalled = false
    
    public func sessionDidStart() {
        sessionDidStartCalled = true
    }
    
    public func sessionDidStop() {
        // Implement if needed
    }
    
    public func sessionDidFailToStartWithError(_ error: Error) {
        // Implement if needed
    }
    
    public func sessionDidFailToStopWithError(_ error: Error) {
        // Implement if needed
    }
}
