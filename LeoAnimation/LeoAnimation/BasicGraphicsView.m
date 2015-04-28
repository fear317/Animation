//
//  BasicGraphicsView.m
//  LeoAnimation
//
//  Created by 张燎原 on 15/4/28.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import "BasicGraphicsView.h"

@implementation BasicGraphicsView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImage];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}

- (void)createImage
{
    //创建绘图上下文，也就是做绘图前的准备工作，比如创建一张画布。
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //创建Transform，用于坐标系转换, (50, 50)是图形自身坐标系统的左上角点(0, 0)在View中的位置.
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
    
    //图形往往是由几个关键点和线条相互连接组成
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddArc(path, &transform, 50, 50, 50, 0, 270.0/180.0 * M_PI, NO);//弧线
    
    CGPathMoveToPoint(path, &transform, 50, 0);//圆心上方的点
    
    CGPathAddLineToPoint(path, &transform, 50, 50);//圆心点，按照图形自身坐标系
    
    CGPathAddLineToPoint(path, &transform, 100, 50);//圆心右侧的点
    
    //将CGMutablePathRef添加到当前Context内
    
    CGContextAddPath(gc, path);
    
    [[UIColor yellowColor] setFill];//内部填充色
    
    [[UIColor redColor] setStroke];//外部边框颜色
    
    CGContextSetLineWidth(gc, 2);//边框宽度，或者说是线条宽度
    
    //执行绘画
    //在图形上下文（画布）中执行绘图，但是并不会显示在界面中
    CGContextDrawPath(gc, kCGPathFillStroke);
    
    //根据当前图形上下文内容，创建一个UIImage
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();//绘图结束
    
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imgView];
}
@end
