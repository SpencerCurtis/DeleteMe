//
//  ColorsTableViewController.swift
//  Colors
//
//  Created by Spencer Curtis on 4/9/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorController.colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)

        cell.textLabel?.text = colorController.colors[indexPath.row].name

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = (segue.destination as? UINavigationController)?.children.first as? ColorDetailViewController else { return }
            
            destinationVC.color = colorController.colors[indexPath.row]
        }
    }
    
    let colorController = ColorsController()
}
