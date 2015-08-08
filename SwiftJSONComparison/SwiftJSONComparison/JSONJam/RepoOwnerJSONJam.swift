//
//  RepoOwnerJSONJam.swift
//  SwiftJSONComparison
//
//  Created by Harlan Kellaway on 8/8/15.
//  Copyright (c) 2015 Harlan Kellaway. All rights reserved.
//

import JSONJam

class RepoOwnerJSONJam: JSONJam {
   
    var ownerId: Int?
    var username: String?
    
    override func propertyMap() {
        map("id", int: &ownerId)
        map("login", string: &username)
    }
    
}

extension RepoOwnerJSONJam: Printable {
    
    var description: String {
        return "RepoOwnerJSONJam - ownerId: \(ownerId); username: \(username)"
    }
}
