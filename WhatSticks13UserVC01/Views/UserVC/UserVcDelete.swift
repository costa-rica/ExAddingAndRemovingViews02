//
//  UserVcDelete.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 30/09/2024.
//

import UIKit

class UserVcDelete: UIView {
    //    weak var delegate: UserVcDeleteDelegate?
    var showLine:Bool!
    let vwDeleteLine = UIView()
    var viewTopAnchor:NSLayoutAnchor<NSLayoutYAxisAnchor>!
    let lblDeleteTitle = UILabel()
    let lblDeleteDescription = UILabel()
    let btnDelete = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.showLine=false
        
    }
    
    init(frame: CGRect, showLine: Bool) {
        self.showLine = showLine
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
