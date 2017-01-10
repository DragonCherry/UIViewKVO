//
//  UIView+KVO.swift
//  Pods
//
//  Created by DragonCherry on 1/9/17.
//
//

import UIKit

private let kUIViewKVODictionaryKey = "kUIViewKVODictionaryKey"

public extension UIView {
    
    /** Set nil on first parameter to remove existing object for key. */
    public func setObject(_ object: Any?, key: String) {
        var dictionary: [String: Any]!
        if let savedDictionary = self.layer.value(forKey: kUIViewKVODictionaryKey) as? [String: Any] {
            dictionary = savedDictionary
        } else {
            dictionary = [String: Any]()
        }
        if let object = object {
            dictionary[key] = object
        } else {
            dictionary.removeValue(forKey: key)
        }
        self.layer.setValue(dictionary, forKey: kUIViewKVODictionaryKey)
    }
    
    public func getObject(_ key: String) -> Any? {
        if let dictionary = self.layer.value(forKey: kUIViewKVODictionaryKey) as? [String: Any] {
            return dictionary[key]
        } else {
            return nil
        }
    }
}
