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
    
    override static func getPrimaryKey() -> String {
        return "chatListId"
    }
    
    override static func getTableName() -> String {
        return "XZChatListModel"
    }

    private override init(){
        super.init()
        print("zzz --- init ")
    }
    
    class var shareSingleton : XZChatListModel {
        struct chatHelper {
            static let chatListModel = XZChatListModel()
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
