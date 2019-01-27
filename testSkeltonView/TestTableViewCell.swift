//
//  TestTableViewCell.swift
//  testSkeltonView
//
//  Created by nancy on 2019/01/27.
//  Copyright © 2019年 WataruNakanishi. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstructLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.showSkeleton()
        titleLabel.showSkeleton()
        abstructLabel.showSkeleton()
    }

    func setContent(_ str: String) {
        titleLabel.text = str
        thumbnailView.hideSkeleton()
        titleLabel.hideSkeleton()
        abstructLabel.hideSkeleton()
    }
    
}
