//
//  ViewController.swift
//  FSTableRefresh
//
//  Created by fei on 16/11/30.
//  Copyright © 2016年 fei. All rights reserved.
//

import UIKit
import MJRefresh

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.mj_header = MJCustomHeader.init(refreshingBlock: {[weak self] in
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2, execute: { 
                self?.items.append("123")
                self?.tableView.reloadData()
                self?.tableView.mj_header.endRefreshing()
            })
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    
}
