//
//  UIGestureRecognizer+Block.h
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^WKGestureBlock)(id gestureRecognizer);
@interface UIGestureRecognizer (Block)
+(instancetype)wk_gestureRecognizerWithActionBlock:(WKGestureBlock)block;
@end
