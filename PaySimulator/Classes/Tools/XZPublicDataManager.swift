//
//  XZPublicDataManager.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPublicDataManager: NSObject {

    static let dataManager = XZPublicDataManager ()
    
    var ocDataManager = {
        return ZPublicDataManager.shareInstance()
    }()
    
    //重写 init 为私有方法
    private override init() {
        ocDataManager = ZPublicDataManager.shareInstance()
    }
    
    //单例
    class var shareSingleton: XZPublicDataManager {
        return dataManager;
    }
    
}

//数据库 相关操作
extension XZPublicDataManager {
    func getDBModelData(modleClass : ZBaseModel.Type) -> ZBaseModel? {
        guard let data = ZPublicDataManager.shareInstance().getDBModelData(modleClass) else {
            return nil
        }
        return data as? ZBaseModel
    }
    
    
    func addOrUpdateModel(data : ZBaseModel) -> Bool {
        return ZPublicDataManager.shareInstance().addOrUpdate(data)
    }
    
    func clearModel(modleClass : ZBaseModel.Type) {
        ZPublicDataManager.shareInstance().clearModel(modleClass)
    }
}
