//
//  UserStore.swift
//  WhatSticks13UserVC01
//
//  Created by Nick Rodriguez on 29/09/2024.
//

import Foundation

class UserStore{
    static let shared = UserStore()
    var isGuestMode = false
    var user = User()
    var isOnline = false
    var isInDevMode = false
    
}
