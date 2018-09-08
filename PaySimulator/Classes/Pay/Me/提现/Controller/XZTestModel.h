//
//  XZTestModel.h
//  PaySimulator
//
//  Created by zzz on 2018/9/8.
//  Copyright © 2018年 再出发. All rights reserved.
//

#import "ZBaseModel.h"
@interface XZTestSubModel : ZBaseModel
@property (nonatomic,copy) NSString *ad  ;
@property (nonatomic,strong) NSArray *adArr;
@end

@interface XZTestModel : ZBaseModel
@property (nonatomic,copy) NSString *test;
@property (nonatomic,copy) NSString *test1;
@property (nonatomic,copy) NSString *test2;
@property (nonatomic,copy) NSString *test3;
@property (nonatomic,strong) NSArray *testArr;
@property (nonatomic,strong) XZTestSubModel *subModel;

@end
//
//let ttModel : XZTestModel =  XZTestModel()
//
//
//if XZPublicDataManager.shareSingleton.addOrUpdateModel(data: ttModel){
//    print("存入成功")
//} else {
//    print("存入失败")
//}
//
//let ttempModel = XZPublicDataManager.shareSingleton.getDBModelData(modleClass: XZTestModel.classForCoder() as! XZTestModel.Type)
//if let sssm : XZTestModel = ttempModel as? XZTestModel {
//    print("zzz - \(sssm.test) , \(sssm.test1)")
//    if let subModel : XZTestSubModel = sssm.subModel {
//        print("zzz - \(subModel.ad ) , \(subModel.adArr )")
//    }
//    }
