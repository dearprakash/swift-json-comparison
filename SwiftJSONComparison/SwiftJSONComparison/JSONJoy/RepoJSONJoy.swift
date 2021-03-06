//
//  RepoJSONJoy.swift
//  SwiftJSONComparison
//
// Copyright (c) 2015 Harlan Kellaway
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import JSONJoy

struct RepoJSONJoy: JSONJoy {
    let repoId: Int
    let name: String
    let desc: String?
    let url: NSURL
    let owner: RepoOwnerJSONJoy
    
    init(_ decoder: JSONDecoder) {
        repoId = decoder["id"].integer!
        name = decoder["name"].string!
        desc = decoder["description"].string
        url = decoder.urlFromString(decoder["html_url"].string!)!
        owner =  RepoOwnerJSONJoy(decoder["owner"])
    }
}

extension JSONDecoder {
    
    func urlFromString(str: String) -> NSURL? {
        return NSURL(string: str)
    }
}

extension RepoJSONJoy: CustomStringConvertible {
    
    var description: String {
        return "RepoJSONJoy - repoId: \(repoId)\nname: \(name)\ndescription: \(desc)\nURL: \(url)\n\(owner)"
    }
}