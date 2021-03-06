//
//  ChatModel.swift
//  MLinker
//
//  Created by 김동현 on 08/08/2019.
//  Copyright © 2019 John Kim. All rights reserved.
//

import ObjectMapper

public enum CommentType : Int {
    case None       = 0
    case Comment    = 1
    case Notice     = 2
    case Date       = 3
}

class ChatModel: Mappable {
    public class Comment : Mappable {
        public var commentType : CommentType = CommentType.None
        public var uid: String?
        public var sender: String?
        public var message: String?
        public var timestamp: Int?
        public var readUsers : Dictionary<String, Bool> = [:]
        public var isNotice: Bool = false
        public var notice:Notice = Notice()
        
        init() {
        }
        
        public required init?(map: Map) {
            
        }
        
        public func mapping(map: Map) {
            uid         <- map["uid"]
            sender      <- map["sender"]
            message     <- map["message"]
            timestamp   <- map["timestamp"]
            readUsers   <- map["readUsers"]
            isNotice    <- map["isNotice"]
            notice      <- map["notice"]
        }
    }
    
    var uid : String = ""
    public var isIncludeAdminAccount: Bool = false
    public var isStandAlone: Bool = false
    public var chatUserIdDic: Dictionary<String,Bool> = [:]
    public var chatUserModelDic : Dictionary<String, UserModel> = [:]
    public var name: String = ""
    public var comments : Dictionary<String, Comment> = [:]
    public var timestamp: Int?
    public var chatRoomImageURL : String?
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        uid                     <- map["uid"]
        isIncludeAdminAccount   <- map["isIncludeAdminAccount"]
        isStandAlone              <- map["standAlone"]
        chatUserIdDic           <- map["chatUserIdDic"]
        name                    <- map["name"]
        comments                <- map["comments"]
        timestamp               <- map["timestamp"]
        chatRoomImageURL        <- map["chatRoomImageURL"]
    }
    
    public func isValid() -> Bool {
        return uid.isEmpty == false
    }
    
}
