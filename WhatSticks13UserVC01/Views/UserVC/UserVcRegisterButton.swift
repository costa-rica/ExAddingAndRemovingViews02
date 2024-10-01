//
//  UserVcRegisterButton.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 30/09/2024.
//

import UIKit

class UserVcRegisterButton: UIView {
    
//    weak var delegate: UserVcRegisterButtonDelegate?
    
    let lblWhyUsernameTitle = UILabel()
    let lblWhyUsernameDescription = UILabel()
    
    let btnRegister = UIButton()
    
    let lblWhyRegisterTitle = UILabel()
    let lblWhyRegisterDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // This triggers as soon as the app starts

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
