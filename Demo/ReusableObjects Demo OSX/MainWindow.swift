//
//  MainWindow.swift
//  VersionTracking Demo
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {

    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let identifier = "kDateFormatterIdentifier"
        if let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter,
            reusedDateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter {
                self.print("\(dateFormatter) vs \(reusedDateFormatter)")
        }
    }

}
