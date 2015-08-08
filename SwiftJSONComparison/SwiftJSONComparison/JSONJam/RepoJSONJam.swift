//
//  RepoJSONJam.swift
//  SwiftJSONComparison
//
//  Created by Harlan Kellaway on 8/8/15.
//  Copyright (c) 2015 Harlan Kellaway. All rights reserved.
//

import JSONJam

class RepoJSONJam: JSONJam {
    
    var repoId: Int?
    var name: String?
    var desc: String?
    var url: NSURL?
    var owner: RepoOwnerJSONJam?
    
    override func propertyMap() {
        map("id", int: &repoId)
        map("name", string: &name)
        map("description", string: &desc)
//        map("html_url", custom: &url)
        map("owner", object: &owner)
    }
    
}

extension RepoJSONJam: Printable {
    
    var description: String {
        return "RepoJSONJoy - repoId: \(repoId)\nname: \(name)\ndescription: \(desc)\nURL: \(url)\n\(owner)"
    }
}
