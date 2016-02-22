//
//  ViewController.swift
//  VersionTracking
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let identifier = "kDateFormatterIdentifier"
        let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier)
        let dateFormatter2 = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier)
        if  let unwrappedDateFormatter = dateFormatter as? NSDateFormatter,
                unwrappedDateFormatter2 = dateFormatter2 as? NSDateFormatter {
                print("\(unwrappedDateFormatter) vs \(unwrappedDateFormatter2)")
        }
    }
}

