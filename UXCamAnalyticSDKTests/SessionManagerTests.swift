//
//  SessionManagerTests.swift
//  UXCamAnalyticSDKTests
//
//  Created by HAR-LAP046-080 on 16/04/2024.
//

import XCTest

@testable import UXCamAnalyticSDK

public class SessionManagerTests: XCTestCase {
    
    var sessionManager: SessionManager!
    var mockDelegate: MockSessionDelegate!
    
    public override func setUp() {
        super.setUp()
        sessionManager = SessionManager()
        mockDelegate = MockSessionDelegate()
        sessionManager.delegate = mockDelegate
    }
    
    public override func tearDown() {
        sessionManager = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    public func testStartSession() {
        // Given
        let userID = "testUser"
        
        // When
        sessionManager.startSession(withUserID: userID)
        
        // Then
        XCTAssertTrue(sessionManager.isSessionActive)
        XCTAssertTrue(mockDelegate.sessionDidStartCalled)
        XCTAssertNotNil(sessionManager.sessionStartTime)
        XCTAssertEqual(sessionManager.currentUserID, userID)
        XCTAssertFalse(mockDelegate.sessionDidFailToStartWithErrorCalled)

    }
    
    
    public func testStopSession() {
        // Given
        sessionManager.isSessionActive = true
        sessionManager.sessionStartTime = Date().timeIntervalSince1970
        let userID = "testUser"
        sessionManager.currentUserID = userID
        
        // When
        sessionManager.stopSession()
        
        // Then
        XCTAssertFalse(sessionManager.isSessionActive)
        XCTAssertTrue(mockDelegate.sessionDidStopCalled)
        XCTAssertNil(sessionManager.currentUserID)
    }
    
    public func testStopSessionWhenNotActive() {
        sessionManager.isSessionActive = false
        
        sessionManager.stopSession()
        
        XCTAssertFalse(mockDelegate.sessionDidStopCalled) // The delegate should not be called if the session was not active
    }
    
}

// Mock SessionDelegate for testing
public class MockSessionDelegate: SessionDelegate {
    var sessionDidStartCalled = false
    var sessionDidStopCalled = false
    var sessionDidFailToStartWithErrorCalled = false
    var sessionDidFailToStopWithErrorCalled = false
    
    public func sessionDidStart() {
        sessionDidStartCalled = true
    }
    
    public func sessionDidStop() {
        sessionDidStopCalled = true
    }
    
    public func sessionDidFailToStartWithError(_ error: Error) {
        sessionDidFailToStartWithErrorCalled = true
    }
    
    public func sessionDidFailToStopWithError(_ error: Error) {
        sessionDidFailToStopWithErrorCalled = true
    }
}
