//
//  PostsModelClass.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 02/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import ObjectMapper

class PostsModelClass : NSObject , Mappable{
    
    var title = ""
    var uuid = ""
    var postType = 0
    var typeName = ""
    var featuredAttachmentUrl = ""
    var featuredAttachmentWidth = 0
    var featuredAttachmentHeigth = 0
    var embedURL = ""
    var creationDate = ""
    var answerCount = 0
    var viewCount = 0
    var voteCount = 0
    var user = Users()
    var shortBodyText = ""
    var deleted = false
    var therapeutics = [Therapeutics]()
    var attachments = [String]()
    var infocenter = ""
    var viewed = false
    var voted = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        uuid <- map["uuid"]
        postType <- map["postType"]
        typeName <- map["typeName"]
        featuredAttachmentUrl <- map["featuredAttachmentUrl"]
        featuredAttachmentWidth <-  map["featuredAttachmentWidth"]
        featuredAttachmentHeigth <- map["featuredAttachmentHeigth"]
        embedURL <- map["embedURL"]
        creationDate <- map["creationDate"]
        answerCount <- map["answerCount"]
        viewCount <- map["viewCount"]
        voteCount <- map["voteCount"]
        user <- map["user"]
        shortBodyText <- map["shortBodyText"]
        deleted <- map["deleted"]
        therapeutics <- map["therapeutics"]
        attachments <- map["attachments"]
        infocenter <- map["infocenter"]
        viewed <- map["viewed"]
        voted <- map["voted"]
        
    }
    
}

class Users : NSObject , Mappable{
    
    var thumbnailUrl = ""
    var firstName = ""
    var lastName = ""
    var authorName = ""
    var uuid = ""
    var designation = ""
    var joinedSince = ""
    var followed = false
    var editor = false
    var loggedIn = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        thumbnailUrl <- map["thumbnailUrl"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        authorName <- map["authorName"]
        uuid <- map["uuid"]
        designation <- map["designation"]
        joinedSince <- map["joinedSince"]
        followed <- map["followed"]
        editor <- map["editor"]
        loggedIn <- map["loggedIn"]
        
    }
    
}

class Therapeutics : NSObject , Mappable{
    var uuid = ""
    var name = ""
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        uuid <- map["uuid"]
        name <- map["name"]
    }
    
}


