//
//  NSObject+Extension.m
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
@implementation NSObject (Extension)
+(NSArray *)ignoredNames{
    return @[@"name"];
}
+(void)encodeWithCoder:(NSCoder *)aCoder{
    Class c = self.class;
    while (c && c!=[NSObject class]) {
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class],&outCount);
        for (int i = 0; i<outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有实现该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) {
                    continue;
                }
            }
            
            id value = [self valueForKeyPath:key];
            [aCoder encodeObject:value forKey:key];
        }
        
        free(ivars);
        c = [c superclass];
    }
}

@end
