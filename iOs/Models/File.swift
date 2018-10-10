//
//  File.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import Foundation

class Serie{
    var name: String!
    var imageFile: String!
    var summary: String!
    var seasons: Int!
    var actors:[Actor]!
    
    init(name: String, imageFile: String, summary: String, seasons: Int, actors: [Actor]){
        self.name = name
        self.imageFile = imageFile
        self.summary = summary
        self.seasons = seasons
        self.actors = actors
    }
    
}
