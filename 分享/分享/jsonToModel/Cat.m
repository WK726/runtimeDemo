//
//  Cat.m
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "Cat.h"
#import <objc/runtime.h>
@implementation Cat
+(instancetype)modelWithDict:(NSDictionary *)dict
{
    id model = [[self alloc] init];
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //注意这里是拿到了成员变量的名称_cid,_age
        ivarName = [ivarName substringFromIndex:1];
        id value = dict[ivarName];
        [model setValue:value forKeyPath:ivarName];
    }
    return model;
}
@end
