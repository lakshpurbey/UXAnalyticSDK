//
//  EventTrack.swift
//  UXCamAnalyticSDK
//
//  Created by HAR-LAP046-080 on 12/04/2024.
//

import Foundation


public class EventTrack {

    // Singleton instance
    public static let shared = EventTrack()
    
    // Private initializer to enforce singleton pattern
    private init() {}
    
    // Public function to track an event with properties
    public func trackEvent(name: String, properties: [String: Any]?) {
        // Code to track the event with properties
        var eventString = "Event: \(name)"
        if let properties = properties {
            for (key, value) in properties {
                eventString += "\n\(key): \(value)"
            }
        }
        print(eventString)
    }
}
