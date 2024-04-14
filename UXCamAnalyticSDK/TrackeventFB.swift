//
//  trackevent.swift
//  UXCamAnalyticSDK
//
//  Created by HAR-LAP046-080 on 12/04/2024.
//

import Foundation

// Protocol representing the analytics service
public protocol AnalyticsService {
    func trackEvent(name: String, properties: [String: Any]?)
}

// Real implementation of AnalyticsService (e.g., using Firebase Analytics)
public class FirebaseAnalyticsService: AnalyticsService {
    public func trackEvent(name: String, properties: [String : Any]?) {
        // Implement tracking event with Firebase Analytics
        print("Tracking event \(name) with properties: \(String(describing: properties)) using Firebase Analytics")
    }
}

// Mock implementation of AnalyticsService for testing
public class MockAnalyticsService: AnalyticsService {
    public func trackEvent(name: String, properties: [String : Any]?) {
        // Just print the event for testing purposes
        print("Mock tracking event \(name) with properties: \(String(describing: properties))")
    }
}

// Protocol for event tracking
public protocol EventTracker {
    func trackEvent(name: String, properties: [String: Any]?)
}

// Real implementation of event tracking using analytics service
public class AnalyticsEventTracker: EventTracker {
    private let analyticsService: AnalyticsService
    
    init(analyticsService: AnalyticsService) {
        self.analyticsService = analyticsService
    }
    
    public func trackEvent(name: String, properties: [String : Any]?) {
        analyticsService.trackEvent(name: name, properties: properties)
    }
}

// Mock implementation of event tracking for testing
public class MockEventTracker: EventTracker {
    public var trackedEvents: [(name: String, properties: [String: Any]?)] = []
    
    public func trackEvent(name: String, properties: [String : Any]?) {
        trackedEvents.append((name: name, properties: properties))
    }
}

public class MySDK {

    // Singleton instance
    public static let shared = MySDK()
    
    // Event tracking dependency
    private var eventTracker: EventTracker
    
    // Private initializer to enforce singleton pattern
    private init(eventTracker: EventTracker = AnalyticsEventTracker(analyticsService: FirebaseAnalyticsService())) {
        self.eventTracker = eventTracker
    }
    
    // Function to set the event tracker (for dependency injection)
    public func setEventTracker(_ eventTracker: EventTracker) {
        self.eventTracker = eventTracker
    }
    
    // Function to track an event with properties
    public func trackEvent(name: String, properties: [String: Any]?) {
        // Delegate event tracking to the event tracker
        eventTracker.trackEvent(name: name, properties: properties)
    }
}
