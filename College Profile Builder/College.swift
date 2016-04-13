//
//  College.swift
//  College Profile Builder
//
//  Created by student1 on 2/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation

class College {
    var webView = String()
    var name = String()
    var description = String()
    var location = String()
    var numberOfStudents = String()
    var image = String()

    
    init(Name n: String,Description d: String,Location l: String,NumberOfStudents s: String,Image i:String, WebView w: String) {
        name = n
        description = d
        location = l
        numberOfStudents = s
        image = i
        webView = w
    }
    init(){
        name = ""
        description = ""
        webView = ""
        
    }
}
