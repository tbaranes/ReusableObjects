//
//  ViewController.swift
//  VersionTracking Demo tvOS
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
        if let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter,
            reusedDateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter {
                print("\(dateFormatter) vs \(reusedDateFormatter)")
        }
    }

}

