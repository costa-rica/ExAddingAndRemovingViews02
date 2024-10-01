//
//  ViewController.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 29/09/2024.
//

import UIKit

class HomeVC: UIViewController {
    let lblTitle = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup_labels()
    }

    func setup_labels(){
        lblTitle.accessibilityIdentifier="lblTitle"
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "Home View"
        lblTitle.font = UIFont(name: "ArialRoundedMTBold", size: 25)
        lblTitle.numberOfLines=0
        view.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

