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
    
    override static func getTableName() -> String {
        return "XZFriendListModel"
    }
    
    
    //MARK:---------------单例------------------------
    /*
    static let shareInstance : XZFriendListModel = XZFriendListModel()
    
   
    
    //确保唯一性，通过此类方法创建对象
    class var shareSingleton: XZFriendListModel {
        return shareInstance;
    }
    */
    
    //MARK:--用户信息单利
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
            self.friendList?.append(userModel)
        }else {
            self.friendList = []
            self.friendList?.append(userModel)
        }
    }
    
    func saveSelfToDB() -> Bool {
        return self.saveToDB()
    }
}
