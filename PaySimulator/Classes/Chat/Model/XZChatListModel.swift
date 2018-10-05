//
//  XZChatListModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/22.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZChatListModel: NSObject {
    // 会话列表
    var chatListId : String = "会话列表"
    var chatList : [XZChatModel]?
    
    //会话列表维度消息设置
    var hadNoRead : Bool = false
    var noReadNum : String?
    
    //生活号
    var lifeNoRead : Bool = false
//    var lifeImage : UIImage?
    var lifeDes : String?
    
    //小程序
    var smallProjectNoRead : Bool = false
//    var smallProjectImage : UIImage?
    var smallProjectDes : String?
    
    //生活圈
    var lifeCircleNoRead : Bool = false
//    var lifeCircleImage : UIImage?
    var lifeCircleDes : String?
    
    
    
    override static func getPrimaryKey() -> String {
        return "chatListId"
    }
    
    override static func getTableName() -> String {
        return "XZChatListModel"
    }

    private override init(){
        super.init()
    }
    
    init(tag : Int) {
        super.init()
        self.getDataFromSql()
    }
    
    class var shareSingleton : XZChatListModel {
        struct chatHelper {
            static let chatListModel = XZChatListModel.init(tag: 0)
        }
        return chatHelper.chatListModel;
    }
}


extension XZChatListModel {
    func getDataFromSql() {
        
        let searchResultArray = XZChatListModel.search(withWhere: nil, orderBy: nil, offset: 0, count: 0)
        if searchResultArray != nil && (searchResultArray?.count)! > 0 {
            let listModel = searchResultArray![0] as? XZChatListModel
            chatList = listModel?.chatList
            
            hadNoRead = listModel?.hadNoRead ?? false
            noReadNum = listModel?.noReadNum
            
            lifeNoRead = listModel?.lifeNoRead ?? false
            lifeDes = listModel?.lifeDes
            
            smallProjectNoRead = listModel?.smallProjectNoRead ?? false
            smallProjectDes = listModel?.smallProjectDes
            
            lifeCircleNoRead = listModel?.lifeCircleNoRead ?? false
            lifeCircleDes = listModel?.lifeCircleDes
        }
    }
    
    func addChatModel(_ chatModel : XZChatModel) {        
        if self.chatList != nil {
            var has = false
            var i = 0
            var index = -1

            for item in self.chatList! {
                if item.chatId == chatModel.chatId {
                    has = true
                    index = i
                }
                i += 1
            }

            if has {
                self.chatList?.remove(at: index)
                self.chatList?.insert(chatModel, at: 0)
            }else {
                self.chatList?.insert(chatModel, at: 0)
            }
        }else {
            self.chatList = []
            self.chatList?.append(chatModel)
        }
    }
    
    func saveSelfToDB() -> Bool {
        return self.saveToDB()
    }
    
    func removeChatModel(_ chatModel : XZChatModel) {
        if self.chatList != nil {
            var has = false
            var i = 0
            var index = -1
            
            for item in self.chatList! {
                if item.chatId == chatModel.chatId {
                    has = true
                    index = i
                }
                i += 1
            }
            
            if has {
                self.chatList?.remove(at: index)
                
                let queue = DispatchQueue(label: "deleteSelfFromDB",qos: .utility)
                queue.async {
                    let _  = XZChatListModel.shareSingleton.saveSelfToDB()
                }
            }
        }
    }
    
    class func dropTable () {
        let globalHelper = XZChatListModel.getUsingLKDBHelper()
        ///删除所有表   delete all table
        globalHelper.dropAllTable()
    }
}
