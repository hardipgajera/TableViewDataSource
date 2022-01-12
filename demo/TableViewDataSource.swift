//
//  TableViewDataSource.swift
//  demo
//
//  Created by hardip gajera on 13/01/22.
//

import Foundation
import UIKit



@objc protocol DataSourceDelegate {
    func dataSource(_ dataSource : Any, didSelectItem item: Any, atIndexPath: IndexPath)
}



class TableViewDataSource<T>: NSObject,UITableViewDelegate, UITableViewDataSource {
    
    var items: [T] = []
    var tableView: UITableView!
    
    weak var delegate: DataSourceDelegate?
    
    init(_ tableView: UITableView, dataSource: DataSourceDelegate) {
        self.tableView = tableView
        self.delegate = dataSource
        super.init()
        self.bindTableView(with: tableView)
    }
    
    func bindTableView(with tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.dataSource(self, didSelectItem: item, atIndexPath: indexPath)
    }
    
}
