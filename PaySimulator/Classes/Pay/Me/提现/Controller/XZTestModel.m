//
//  XZTestModel.m
//  PaySimulator
//
//  Created by zzz on 2018/9/8.
//  Copyright © 2018年 再出发. All rights reserved.
//

#import "XZTestModel.h"

@implementation XZTestSubModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.ad = @"subad32";
        self.adArr = @[@"ad12",@"ad34",@"ad23"];
    }
    return self;
}
@end

@implementation XZTestModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.test = @"lilei";
        self.test1 = @"weapon";
        self.test2 = @"shouji";
        self.test3 = @"dianzhi";
        self.testArr = @[@"12",@"34",@"23"];
        self.subModel = [[XZTestSubModel alloc] init];
    }
    return self;
}
@end
