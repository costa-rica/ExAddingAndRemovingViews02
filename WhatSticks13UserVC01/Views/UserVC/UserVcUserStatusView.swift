//
//  UserVcUserStatusView.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 30/09/2024.
//

import UIKit

class UserVcUserStatusView: UIView {
    
    var showLine:Bool!
    let vwUserStatusLine = UIView()
    var viewTopAnchor:NSLayoutAnchor<NSLayoutYAxisAnchor>!
    
    var userStore: UserStore!
    let lblTitleUserStatus = UILabel()
    
    let stckVwUser = UIStackView()
    
    let stckVwUsername = UIStackView()
    let lblUsername = UILabel()
    let btnUsernameFilled = UIButton()
    
    let stckVwRecordCount = UIStackView()
    let lblRecordCount = UILabel()
    let btnRecordCountFilled = UIButton()
    
    var constraints_NO_VwRegisterButton = [NSLayoutConstraint]()
    
    let vwRegisterButton = UserVcRegisterButton()
    var constraints_YES_VwRegisterButton = [NSLayoutConstraint]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.showLine = false
        
    }
    init(frame: CGRect, showLine: Bool) {
        self.showLine = showLine
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
