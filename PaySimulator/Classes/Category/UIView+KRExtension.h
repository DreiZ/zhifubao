//
//  UIView+KRExtension.h
//  百思不得姐
//
//  Created by sha0530 on 16/10/20.
//  Copyright © 2016年 沙先鼎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KRExtension)

@property (nonatomic ,assign) CGSize dd_size;

@property (nonatomic ,assign) CGFloat dd_width;

@property (nonatomic ,assign) CGFloat dd_height;


@property (nonatomic ,assign) CGFloat dd_x;

@property (nonatomic ,assign) CGFloat dd_y;

@property (nonatomic ,assign) CGFloat dd_centerX;

@property (nonatomic ,assign) CGFloat dd_centerY;

@property (nonatomic ,assign) CGFloat dd_right;

@property (nonatomic ,assign) CGFloat dd_bottom;

/**从xib加载和类名一样的view*/
+(instancetype)viewFromXib;

/**当前view是否和window重叠*/
- (BOOL)dd_intersectWithView:(UIView *)view;

@end
