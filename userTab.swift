//
//  userTab.swift
//  MyDok
//
//  Created by georg syncov on 25.04.17.
//  Copyright © 2017 georg syncov. All rights reserved.
//

import Foundation

class User: NSObject {
    var userEmailStored : String
    var userPasswordStored : String
    
    override init() {
        userEmailStored = ""
        userPasswordStored = ""
    }
}
