//
//  UserVC.swift
//  TabBar07
//
//  Created by Nick Rodriguez on 28/06/2024.
//

import UIKit

class UserVC: TemplateVC{

    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let vwDemoSwitch = DemoSwitchView()
        
    let vwFindAppleHealthPermissions = UserVcFindAppleHealthPermissionsView()

    let vwLocationDayWeather = UserVcLocationDayWeather(frame: CGRect.zero, showLine: true)

    let vwOffline = UserVcOffline(frame: CGRect.zero, showLine: true)
    var constraints_Offline_NoEmail = [NSLayoutConstraint]()

    let vwUserStatus = UserVcUserStatusView(frame: CGRect.zero, showLine: true)
    var constraints_Online_NoEmail = [NSLayoutConstraint]()
    
    
    let vwUserDeleteAccount = UserVcDelete(frame: CGRect.zero, showLine: true)
    var constraints_Online_YesEmail = [NSLayoutConstraint]()
    
    var constraints_Offline_YesEmail = [NSLayoutConstraint]()
    
    /* Dev view dependent properties */
//    let vwUserStatusDeveloperView = UserStatusDevelopmentView(frame: CGRect.zero, showLine: true)
    var constraintsForBottomOfUserVcContentView = [NSLayoutConstraint]()
    var bottomAnchorForUserVcContentBottomAnchor:NSLayoutAnchor<NSLayoutYAxisAnchor>!


    override func viewDidLoad() {
        print("- in UserVC viewDidLoad -")
        super.viewDidLoad()
//        vwOffline.delegate = self
//        vwUserStatus.vwRegisterButton.delegate = self
//        vwLocationDayWeather.delegate = self
//        vwUserDeleteAccount.delegate = self

        self.setup_TopSafeBar()
        setupScrollView()
        setupContentView()
        ManageContentViews()
    }
    
    func ManageContentViews(){
        setup_vwDemoSwitch()
        setup_vwFindAppleHealthPermissions()
        setup_vwLocationDayWeather()
    }
    func setup_vwDemoSwitch(){
        vwDemoSwitch.accessibilityIdentifier = "vwDemoSwitch"
        vwDemoSwitch.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vwDemoSwitch)

        NSLayoutConstraint.activate([
            vwDemoSwitch.topAnchor.constraint(equalTo: contentView.topAnchor),
            vwDemoSwitch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vwDemoSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            vwDemoSwitch.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: heightFromPct(percent: -10))
        ])
    }
    
    func setup_vwFindAppleHealthPermissions(){
        vwFindAppleHealthPermissions.accessibilityIdentifier = "vwFindAppleHealthPermissions"
        vwFindAppleHealthPermissions.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vwFindAppleHealthPermissions)

        NSLayoutConstraint.activate([
            vwFindAppleHealthPermissions.topAnchor.constraint(equalTo: vwDemoSwitch.bottomAnchor),
            vwFindAppleHealthPermissions.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vwFindAppleHealthPermissions.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            vwFindAppleHealthPermissions.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: heightFromPct(percent: -10))
        ])
    }
    func setup_vwLocationDayWeather(){
        vwLocationDayWeather.accessibilityIdentifier = "vwLocationDayWeather"
        vwLocationDayWeather.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vwLocationDayWeather)

        NSLayoutConstraint.activate([
            vwLocationDayWeather.topAnchor.constraint(equalTo: vwFindAppleHealthPermissions.bottomAnchor),
            vwLocationDayWeather.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vwLocationDayWeather.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vwLocationDayWeather.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: heightFromPct(percent: -10))
        ])
    }
    
}


/* Old Views */
extension UserVC {
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: vwTopSafeBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupContentView() {
        contentView.accessibilityIdentifier = "contentView"
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
         NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // This ensures vertical scrolling
        ])
    }
    
    
    /*Manage Views */
    func manageUserVcOptionalViews(){
        
        // Choose the bottomAnchor depending on isOnline and email status
        if UserStore.shared.isGuestMode{
            bottomAnchorForUserVcContentBottomAnchor = vwUserStatus.bottomAnchor// same as case_option_2_
        }
        else if !UserStore.shared.isOnline, UserStore.shared.user.email == nil {
            bottomAnchorForUserVcContentBottomAnchor = vwOffline.bottomAnchor
        }else if UserStore.shared.isOnline, UserStore.shared.user.email == nil{
            bottomAnchorForUserVcContentBottomAnchor = vwUserStatus.bottomAnchor
        } else if UserStore.shared.isOnline, UserStore.shared.user.email != nil{
            bottomAnchorForUserVcContentBottomAnchor = vwUserDeleteAccount.bottomAnchor
        } else if !UserStore.shared.isOnline, UserStore.shared.user.email != nil {
            bottomAnchorForUserVcContentBottomAnchor = vwOffline.bottomAnchor
        }
        
//        // Choose App's Mode: Dev or Prod and create set of constraints to attached to the bottom of the contentView
//        if UserStore.shared.isInDevMode{
//            constraintsForBottomOfUserVcContentView = [
//                vwUserStatusDeveloperView.topAnchor.constraint(equalTo: bottomAnchorForUserVcContentBottomAnchor, constant: heightFromPct(percent: 3)),
//                vwUserStatusDeveloperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//                vwUserStatusDeveloperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//                vwUserStatusDeveloperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: heightFromPct(percent: -10)),
//            ]
//        } else {
//            constraintsForBottomOfUserVcContentView = [
//                bottomAnchorForUserVcContentBottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: heightFromPct(percent: -10)),
//            ]
//        }
        
//        // Choose case depending on isGuestMode, isOnline and email
//        if UserStore.shared.isGuestMode{
//            case_option_2_Online_and_generic_name()
//        }
//        else if !UserStore.shared.isOnline, UserStore.shared.user.email == nil {
//            case_option_1_Offline_and_generic_name()
//        }else if UserStore.shared.isOnline, UserStore.shared.user.email == nil{
//            case_option_2_Online_and_generic_name()
//        } else if UserStore.shared.isOnline, UserStore.shared.user.email != nil{
//            case_option_3_Online_and_custom_email()
//        } else if !UserStore.shared.isOnline, UserStore.shared.user.email != nil {
//            case_option_4_Offline_and_custom_email()
//        }
        
//        // If Dev add the UserStatusDeveloperView
//        if UserStore.shared.isInDevMode{
//            vwUserStatusDeveloperView.delegate = self
//            setup_vwUserStatusDeveloperView()
//        }
        
        // Activate bottom constraint which is dependent of whether or not UserStatusDeveloperView is present
        NSLayoutConstraint.activate(constraintsForBottomOfUserVcContentView)
    }
    
    func remove_optionalViews(){
        NSLayoutConstraint.deactivate(constraintsForBottomOfUserVcContentView)
        NSLayoutConstraint.deactivate(constraints_Offline_NoEmail)
        NSLayoutConstraint.deactivate(constraints_Online_NoEmail)
        NSLayoutConstraint.deactivate(constraints_Offline_YesEmail)
        NSLayoutConstraint.deactivate(constraints_Online_YesEmail)
        vwLocationDayWeather.removeFromSuperview()
        vwOffline.removeFromSuperview()
        vwUserStatus.removeFromSuperview()
        vwUserDeleteAccount.removeFromSuperview()
//        vwUserStatusDeveloperView.removeFromSuperview()
        print("--- finished remove_optionalViews -")
    }
}




