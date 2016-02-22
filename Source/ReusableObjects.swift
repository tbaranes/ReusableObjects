//
//  ReusableObjects.swift
//  ReusableFormatterDemo
//
//  Created by Tom Baranes on 22/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension NSObject {

    // Attempts to register a class to reuse it anywhere in your application. Does nothing if the current object or identifier is not valid.
    // The `reuseIdentifier` parameter must not be nil and must not be an empty string.
    public static func registerObjectWithIdentifier(reuseIdentifier: String) {
        let object = self.init()
        ReusableObjects.sharedInstance.registerObject(object, identifier: reuseIdentifier)
    }

    // Unregister the object located by its identifiers. Doesn nothing if the object doesn't exist.
    public func registerObjectWithIdentifier(reuseIdentifier: String) {
        ReusableObjects.sharedInstance.registerObject(self, identifier: reuseIdentifier)
    }
    
    // Attempts to unregister a NSObject from its identifier. 
    // Does nothing if the object hasn't been registered before
    public static func unregisterObjectWithIdentifier(reuseIdentifier: String) {
        ReusableObjects.sharedInstance.unregisterObjectWithIdentifier(reuseIdentifier)
    }

    // Returns a reusable `NSObject` object located by its identifier.
    // If any object found, it will register the object before returning the object registered or nil if an error occured.
    public static func dequeueReusableObjectWithIdentifier(reuseIdentifier: String) -> AnyObject? {
        let className = NSStringFromClass(self).componentsSeparatedByString(".").last!
        return ReusableObjects.sharedInstance.dequeueReusableObjectWithIdentifier(reuseIdentifier, className: className)
    }
    
}

private struct ReusableObjects {
    
    private var reusableObjects = [String: AnyObject]()
    
    // MARK: - Singleton
    
    static var sharedInstance = ReusableObjects()
    private init() {}
    
    // MARK: Reuse
    
    mutating func registerObject(object: AnyObject?, identifier: String) {
        guard identifier.isEmpty == false else {
            return
        }
        
        if let unwrappedObject = object {
            reusableObjects[identifier] = unwrappedObject
        }
    }
    
    mutating func unregisterObjectWithIdentifier(identifier: String) {
        guard identifier.isEmpty == false else {
            return
        }
        
        reusableObjects.removeValueForKey(identifier)
    }
    
    mutating func dequeueReusableObjectWithIdentifier(identifier: String, className: String) -> AnyObject? {
        guard identifier.isEmpty == false else {
            return nil
        }
        
        var object = reusableObjects[identifier]
        if object == nil, let aClass = NSClassFromString(className) as? NSObject.Type {
            object = aClass.init()
            registerObject(object, identifier: identifier)
        }
        return object
    }
    
}