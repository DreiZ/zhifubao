//
//  UIView+KRExtension.m
//  百思不得姐
//
//  Created by sha0530 on 16/10/20.
//  Copyright © 2016年 沙先鼎. All rights reserved.
//

#import "UIView+KRExtension.h"

@implementation UIView (KRExtension)


-(CGSize)dd_size{
    
    return self.frame.size;
}


-(void)setDd_size:(CGSize)dd_size{
    
    CGRect frame = self.frame;
    
    frame.size = dd_size;
    
    self.frame = frame;
    
}

-(CGFloat)dd_width{
    
    return self.frame.size.width;
    
}

-(CGFloat)dd_height{
    
    return self.frame.size.height;
    
}




-(void)setDd_width:(CGFloat)dd_width{
    
    CGRect frame = self.frame;
    
    frame.size.width = dd_width;
    
    self.frame = frame;
    
}

-(void)setDd_height:(CGFloat)dd_height{
    
    CGRect frame = self.frame;
    
    frame.size.height = dd_height;
    
    self.frame = frame;

}




-(CGFloat)dd_x{
    
    return self.frame.origin.x;
}

-(CGFloat)dd_y{
    
     return self.frame.origin.y;
}

-(void)setDd_x:(CGFloat)dd_x{
    
    CGRect frame = self.frame;
    
    frame.origin.x = dd_x;
    
    self.frame = frame;
}

-(void)setDd_y:(CGFloat)dd_y{
    
    CGRect frame = self.frame;
    
    frame.origin.y = dd_y;
    
    self.frame = frame;
    
}



-(CGFloat)dd_centerX{
    
    return self.center.x;
    
}

-(CGFloat)dd_centerY{
    
    return self.center.y;
    
}








-(void)setDd_centerX:(CGFloat)dd_centerX{
    
    CGPoint center = self.center;
    
    center.x = dd_centerX;
    
    
    self.center = center;
    
    
    
}

    
-(void)setDd_centerY:(CGFloat)dd_centerY{
    
    
    CGPoint center = self.center;
    
    center.y = dd_centerY;
    
    
    self.center = center;
    

    
}
    
-(CGFloat)dd_right{
    
    
    return CGRectGetMaxX(self.frame);
    
}

-(CGFloat)dd_bottom{
    
    return CGRectGetMaxY(self.frame);
}

-(void)setDd_right:(CGFloat)dd_right{
    
    self.dd_x = dd_right - self.dd_width;
    
}

-(void)setDd_bottom:(CGFloat)dd_bottom{
    
    self.dd_y = dd_bottom - self.dd_height;
    
}



+(instancetype)viewFromXib{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    
}


- (BOOL)dd_intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}

@end
