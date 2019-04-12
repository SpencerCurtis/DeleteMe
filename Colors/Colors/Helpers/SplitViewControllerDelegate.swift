//
//  SplitViewControllerDelegate.swift
//  Colors
//
//  Created by Spencer Curtis on 4/9/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        // Collapse the interface into a single view controller.
        
        guard let detailNavVC = secondaryViewController as? UINavigationController,
            let detailVC = detailNavVC.topViewController as? ColorDetailViewController else {
                return false
        }
        
        if detailVC.color == nil {
            return true
        } else {
            return false
        }
    }
}
