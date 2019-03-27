//
//  UIImage+Image.m
//  分享
//
//  Created by 王开 on 2019/3/27.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>
//这里我们写一个UIImage的类目,来保证UIImage,不会被渲染,同时,如果图片为空,会打印提示.
@implementation UIImage (Image)
// 加载内存时调用

+ (void)load
{
    // 交换方法
    
    // 获取 ImageOriginalWithStrName: 方法
    Method imageWithName = class_getClassMethod(self, @selector(ImageOriginalWithStrName:));
    
    // 获取 imageName 方法
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    
    // 交换方法地址, 相当于交换实现
    
    method_exchangeImplementations(imageWithName, imageName);
    
}
// 不能在改分类UIImage中重写 imageNamed:因为系统会把imageNamed:原来的功能覆盖掉
// 分类中不能调用super本身

+ (id)ImageOriginalWithStrName:(NSString *)name
{
    UIImage *image = [[self ImageOriginalWithStrName:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (image == nil) {
        NSLog(@"加载图片为空...");
    }
    
    return image;
    
}
@end
