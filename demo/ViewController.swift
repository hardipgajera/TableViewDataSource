//
//  ViewController.swift
//  demo
//
//  Created by hardip gajera on 13/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countDataSource: CountDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponents()
    }
    
    func setUpComponents() {
        countDataSource = CountDataSource(tableView, dataSource: self)
    }


}

extension ViewController: DataSourceDelegate {

    func dataSource(_ dataSource: Any, didSelectItem item: Any, atIndexPath: IndexPath) {
    }
    
}

