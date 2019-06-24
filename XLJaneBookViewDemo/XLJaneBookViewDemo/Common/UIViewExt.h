//
//  UIView+ViewFrameGeometry.h
//  XLJaneBookViewDemo
//
//  Created by Mac-Qke on 2019/3/15.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

CGPoint CGRectGetCenter(CGRect rect);
CGRect CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (void)moveBy:(CGPoint)delta;
- (void)scaleBy:(CGFloat)scaleFactor;
- (void)fitInSize:(CGSize)aSize;

// 改变显示颜色
- (void)modifyTintColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
