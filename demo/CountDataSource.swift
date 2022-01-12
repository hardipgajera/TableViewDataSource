//
//  CountDataSource.swift
//  demo
//
//  Created by hardip gajera on 13/01/22.
//

import UIKit
import Combine

class CountDataSource: TableViewDataSource<Int> {
    
    var cancellable = Set<AnyCancellable>()
    
    override init(_ tableView: UITableView, dataSource: DataSourceDelegate) {
        super.init(tableView, dataSource: dataSource)
        reset()
        fetchData()
    }
    
    
    private func fetchData() {
        Array(1...100).publisher
            .flatMap(maxPublishers: .max(10)) { Just($0) .delay(for: 2, scheduler: RunLoop.main) }
            .sink(receiveValue: { [weak self] value in
                guard let `self` = self else { return }
                self.items.append(value)
                self.tableView.reloadData()
            })
            .store(in: &cancellable)
    }
    
    private func reset() {
        self.items = []
    }
    
    
    
    // data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell()
        c.textLabel?.text = items[indexPath.row].description
        return c
    }
}

