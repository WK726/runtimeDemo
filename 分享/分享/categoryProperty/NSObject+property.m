//
//  NSObject+property.m
//  分享
//
//  Created by 王开 on 2019/3/27.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/runtime.h>
static const char *key = "name";
@implementation NSObject (property)
//类别中可以添加属性但是不能自动生成getter、setter方法，需要建立关联引用
- (NSString *)name
{
    // 根据关联的key,获取关联的值
    return objc_getAssociatedObject(self, key);
}
- (void)setName:(NSString *)name
{
    // 参数1 <#id object#> 给那个对象添加关联
    // 参数2 <#const void *key#> 关联的key 值,通过这个key 值获取
    // 参数3 <#id value#> 关联的value
    // 参数4 <#objc_AssociationPolicy policy#> 关联的策略
    
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
