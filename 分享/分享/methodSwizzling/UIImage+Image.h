//
//  UIImage+Image.h
//  分享
//
//  Created by 王开 on 2019/3/27.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// 创建一个类方法

// 传入 一个字符串 -> 返回 不被 渲染的原始图片

+ (id)ImageOriginalWithStrName:(NSString *)name;
@end
