
//
//  UIImage+ColorImage.m
//  CityListDemo
//
//  Created by zhongzhi on 2017/6/16.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "UIImage+ColorImage.h"

@implementation UIImage (ColorImage)
+(UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size{
    
    CGRect rect =CGRectMake(0,0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
@end
