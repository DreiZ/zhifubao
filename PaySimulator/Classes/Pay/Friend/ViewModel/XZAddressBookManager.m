//
//  XZAddressBookManager.m
//  NYfangzhi
//
//  Created by 再出发 on 2018/8/6.
//  Copyright © 2018年 sha xianding. All rights reserved.
//

#import "XZAddressBookManager.h"
#import "PaySimulator-Swift.h"

@interface XZAddressBookManager ()
@property (nonatomic,strong) NSArray *resultArray;

@end
@implementation XZAddressBookManager



// 按首字母分组排序数组
+(NSMutableArray *)sortObjectsAccordingToInitialWith:(NSArray *)arr {
    
    // 初始化UILocalizedIndexedCollation
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    //得出collation索引的数量，这里是27个（26个字母和1个#）
    NSInteger sectionTitlesCount = [[collation sectionTitles] count];
    
    //初始化一个数组newSectionsArray用来存放最终的数据，我们最终要得到的数据模型应该形如@[@[以A开头的数据数组], @[以B开头的数据数组], @[以C开头的数据数组], ... @[以#(其它)开头的数据数组]]
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    //初始化27个空数组加入newSectionsArray
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    //将每个名字分到某个section下
    for ( XZAddressBookModel *personModel in arr) {
        //获取name属性的值所在的位置，比如"林丹"，首字母是L，在A~Z中排第11（第一位是0），sectionNumber就为11
        
        NSInteger sectionNumber = [collation sectionForObject:personModel collationStringSelector:@selector(username)];
  
        personModel.acapital = [collation sectionTitles][sectionNumber];
        //把name为“林丹”的p加入newSectionsArray中的第11个数组中去
        NSMutableArray *sectionNames = newSectionsArray[sectionNumber];
        [sectionNames addObject:personModel];
    }
    
    //对每个section中的数组按照name属性排序
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *personArrayForSection = newSectionsArray[index];
        NSArray *sortedPersonArrayForSection = [collation sortedArrayFromArray:personArrayForSection collationStringSelector:@selector(username)];
        newSectionsArray[index] = sortedPersonArrayForSection;
    }
    
        //删除空的数组
        NSMutableArray *finalArr = [NSMutableArray new];
        for (NSInteger index = 0; index < sectionTitlesCount; index++) {
            if (((NSMutableArray *)(newSectionsArray[index])).count != 0) {
                [finalArr addObject:newSectionsArray[index]];
            }
        }
     
        return finalArr;
    
    
    return newSectionsArray;
}



//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}


@end
