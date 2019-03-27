//
//  UIGestureRecognizer+Block.m
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

static const int target_key;
@implementation UIGestureRecognizer (Block)
+(instancetype)wk_gestureRecognizerWithActionBlock:(WKGestureBlock)block{
    return [[self alloc] initWithActionBlock:block];
}
- (instancetype)initWithActionBlock:(WKGestureBlock)block
{
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}
-(void)addActionBlock:(WKGestureBlock)block
{
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}
-(void)invoke:(id)sender{
    WKGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}
@end
