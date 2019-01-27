//
//  ViewController.swift
//  testSkeltonView
//
//  Created by nancy on 2019/01/27.
//  Copyright © 2019年 WataruNakanishi. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.showSkeleton()
        label2.showSkeleton()
        tableView.register(UINib(nibName: "TestTableViewCell", bundle: nil), forCellReuseIdentifier: "testCell")
        tableView.dataSource = self
        tableView.reloadData()
        tableView.showSkeleton()
        showCell()
    }
    
    private func showCell() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.array.append("first Cell Title")
            self.array.append("second cell title")
            self.label1.text = self.array[0]
            self.label2.text = self.array[1]
            self.label1.hideSkeleton()
            self.label2.hideSkeleton()
            self.view.hideSkeleton()
            self.tableView.reloadData()
        })
    }
}

extension ViewController: SkeletonTableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "testCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! TestTableViewCell
        cell.setContent(array[indexPath.row])
        return cell
    }
    
    
}

