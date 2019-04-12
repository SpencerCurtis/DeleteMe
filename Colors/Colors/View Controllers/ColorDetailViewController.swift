//
//  ColorDetailViewController.swift
//  Colors
//
//  Created by Spencer Curtis on 4/9/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        
        updateViews()
    }
    

    func updateViews() {
        guard let color = color, isViewLoaded else { return }
        
        title = color.name
        view.backgroundColor = color.color
    }
    
    var color: Color? {
        didSet {
            updateViews()
        }
    }

}
