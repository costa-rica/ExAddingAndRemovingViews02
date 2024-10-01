//
//  UserVcLocationDayWeather.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 30/09/2024.
//

import UIKit

class UserVcLocationDayWeather: UIView {
    
    let lblTitle = UILabel()
//    weak var delegate: UserVcLocationDayWeatherDelegate?// instantiated in UserVC.viewDidLoad()
    var showLine:Bool!
    let vwLocationDayWeatherLine = UIView()
    var viewTopAnchor:NSLayoutAnchor<NSLayoutYAxisAnchor>!
    
    let lblLocationDayWeatherTitle = UILabel()
    let lblLocationDayWeatherDetails = UILabel()
    
    let stckVwLocTrackReoccurring = UIStackView()
    let lblLocTrackReoccurringSwitch=UILabel()
    let swtchLocTrackReoccurring = UISwitch()
    
    let lblDeviceLocationStatus = UILabel()
    
    init(frame: CGRect, showLine: Bool) {
        self.showLine = showLine
        super.init(frame: frame)
        setup_labels()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func setup_labels(){
        lblTitle.accessibilityIdentifier="lblTitle"
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "Weather View"
        lblTitle.font = UIFont(name: "ArialRoundedMTBold", size: 25)
        lblTitle.numberOfLines=0
        self.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: heightFromPct(percent: 2)),
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: widthFromPct(percent: 2)),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: widthFromPct(percent: -2)),
            lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: heightFromPct(percent: -2))
        ])
    }
    
    
    
}
