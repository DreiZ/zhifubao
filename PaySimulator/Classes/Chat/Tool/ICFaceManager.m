//
//  ICFaceManager.m
//  XZ_WeChat
//
//  Created by 郭现壮 on 16/4/1.
//  Copyright © 2016年 gxz All rights reserved.
//

#import "ICFaceManager.h"
//#import "XZEmotion.h"
#import "ICFaceManager.h"
#import <Foundation/Foundation.h>

#define ICBundle [NSBundle mainBundle]

@implementation ICFaceManager

static NSArray * _emojiEmotions,*_custumEmotions,*gifEmotions;

+ (NSArray *)emojiEmotion
{
    if (_emojiEmotions) {
        return _emojiEmotions;
    }
    NSString *path  = [ICBundle pathForResource:@"BaseEmotion.plist" ofType:nil];
    NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
//    _emojiEmotions  = [XZEmotion mj_objectArrayWithKeyValuesArray:tempArr];
    return _emojiEmotions;
}

+ (NSArray *)customEmotion
{
    if (_custumEmotions) {
        return _custumEmotions;
    }
    NSString *path  = [ICBundle pathForResource:@"normal_face.plist" ofType:nil];
//    _custumEmotions = [XZEmotion mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    return _custumEmotions;
}

+ (NSArray *)gifEmotion
{
    return nil;
}



@end
