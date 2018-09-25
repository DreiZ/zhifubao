//
//  XZFriendListModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZFriendListModel: NSObject {
    //好友列表
    var friendList : [XZUserModel]?
    var friendId : String = "好友列表"
    
    override static func getPrimaryKey() -> String {
        return "friendId"
    }
    
    override static func getTableName() -> String {
        return "XZFriendListModel"
    }
    
    
//    //MARK:---------------单例------------------------
//    static let shareInstance : XZFriendListModel = XZFriendListModel()
    //    //确保唯一性，通过此类方法创建对象
    //    class var shareSingleton: XZFriendListModel {
    //        return shareInstance;
    //    }
    
    private override init(){
        super.init()
        print("zzz --- init ")
    }
    
    class var shareSingleton : XZFriendListModel {
        struct userHelper {
            static let friendListModel = XZFriendListModel()
        }
        return userHelper.friendListModel;
    }
}

extension XZFriendListModel {
    func getDataFromSql() {
        let searchResultArray = XZFriendListModel.search(withWhere: nil, orderBy: nil, offset: 0, count: 0)
        
        if searchResultArray != nil && (searchResultArray?.count)! > 0 {
            let listModel = searchResultArray![0] as? XZFriendListModel
            friendList = listModel?.friendList
        }
    }
    
    func addUserModel(_ userModel : XZUserModel) {
        if self.friendList != nil {
            if (self.friendList?.count)! > 0 {
                let friendListCount = (self.friendList?.count ?? 0) - 1
                self.friendList?.insert(userModel, at: friendListCount)
            }else {
                self.friendList?.append(userModel)
            }
        }else {
            self.friendList = []
            self.friendList?.append(userModel)
        }
    }
    
    func addSelfUserModel(_ userModel : XZUserModel) {
        if self.friendList != nil {
            self.friendList?.append(userModel)
        }else {
            self.friendList = []
            self.friendList?.append(userModel)
        }
    }
    
    func saveSelfToDB() -> Bool {
        return self.saveToDB()
    }
    
     class func dropTable () {
        let globalHelper = XZFriendListModel.getUsingLKDBHelper()
        ///删除所有表   delete all table
        globalHelper.dropAllTable()
    }
}
