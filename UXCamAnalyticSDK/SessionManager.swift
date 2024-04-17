//
//  SessionManager.swift
//  UXCamAnalyticSDK
//
//  Created by HAR-LAP046-080 on 12/04/2024.
//

import Foundation

// SessionDelegate.swift
public protocol SessionDelegate: AnyObject {
    func sessionDidStart()
    func sessionDidStop()
    func sessionDidFailToStartWithError(_ error: Error)
    func sessionDidFailToStopWithError(_ error: Error)

}

public class SessionManager {
    
    public weak var delegate: SessionDelegate?
    public var currentUserID: String?
    public var isSessionActive = false

    public let sessionStartTimeKey = "SessionStartTime"
    
     var sessionStartTime: TimeInterval? {
        get {
            return UserDefaults.standard.double(forKey: sessionStartTimeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: sessionStartTimeKey)
        }
    }
    
    public init() {
           // Perform initialization here if needed
       }
    
    public func startSession(withUserID userID: String) {
        // Start the session
               
               guard !isSessionActive else {
                   delegate?.sessionDidFailToStartWithError(SessionError.sessionAlreadyActive)
                   return
               }
               
               // Authenticate user
               authenticateUser(userID: userID)
               
               // Save session start time
               sessionStartTime = Date().timeIntervalSince1970
               
               // Notify the delegate that the session has started
               isSessionActive = true
               delegate?.sessionDidStart()
    }
    
    public func authenticateUser(userID: String) {
           // Code to authenticate the user with the provided user ID
           currentUserID = userID
       }
    
    public func stopSession() {
        
        guard isSessionActive else {
                  delegate?.sessionDidFailToStopWithError(SessionError.noActiveSession)
                  return
              }
              
              // Retrieve session start time
              guard let sessionStartTime = sessionStartTime else {
                  // Session is not started yet
                  return
              }
              
              // Calculate session duration
              let sessionEndTime = Date().timeIntervalSince1970
              let sessionDuration = sessionEndTime - sessionStartTime
              print("sessionDuration", sessionDuration)
              
              // Reset session start time
              self.sessionStartTime = nil
              
              // Notify the delegate that the session has stopped
              isSessionActive = false
              currentUserID = nil
              delegate?.sessionDidStop()
    }
    
    public func trackEvent(_ eventName: String, properties: [String: Any]) {
        // Track the event
        print("Tracking event '\(eventName)' with properties: \(properties)")
        
    }
}
