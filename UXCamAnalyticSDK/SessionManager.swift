//
//  SessionManager.swift
//  UXCamAnalyticSDK
//
//  Created by HAR-LAP046-080 on 12/04/2024.
//

import Foundation

public class SessionManager {

    // Singleton instance
    public static let shared = SessionManager()
    
    // UserDefaults key for session data
    private let sessionKey = "uxcamkey"
    private let startTimeKey = "sessionStartTime"

    
    // Private initializer to enforce singleton pattern
    private init() {}
    
    // Function to start a session
    public func startSession() {
        
        UserDefaults.standard.set(Date(), forKey: startTimeKey)
        UserDefaults.standard.set(true, forKey: sessionKey)
        UserDefaults.standard.synchronize()

    }
    
    // Function to check if a session is active
    public func isSessionActive() -> Bool {
        return UserDefaults.standard.bool(forKey: sessionKey)
    }
    
    // Function to end a session
    public func endSession() {
        UserDefaults.standard.removeObject(forKey: sessionKey)
        UserDefaults.standard.removeObject(forKey: startTimeKey)
    }
    
    // Function to get the session start time
      public func getSessionStartTime() -> Date? {
          return UserDefaults.standard.object(forKey: startTimeKey) as? Date
      }
}
