//
//  ViewCaptureSession.swift
//  UXCamAnalyticSDK
//
//  Created by HAR-LAP046-080 on 10/04/2024.
//

import Foundation

public class CaptureSession {

    // Singleton instance
    public static let shared = CaptureSession()
    
    // Private initializer to enforce singleton pattern
    private init() {}
    
    // Public function to start a session
    public func startSession() {
        // Code to start the session
        print("Session started")
        
    }
    
    // Public function to stop a session
    public func stopSession() {
        // Code to stop the session
        print("Session stopped")
    }
}

