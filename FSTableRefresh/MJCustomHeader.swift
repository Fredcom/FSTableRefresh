//
//  MJCustomHeader.swift
//  FSTableRefresh
//
//  Created by fei on 16/11/30.
//  Copyright © 2016年 fei. All rights reserved.
//

import UIKit
import MJRefresh

class MJCustomHeader: MJRefreshNormalHeader {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func prepare() {
        super.prepare()
        
        stateLabel.isHidden = true
        lastUpdatedTimeLabel.isHidden = true
    }
}
