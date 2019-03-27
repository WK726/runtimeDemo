//
//  addSelector.m
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "addSelector.h"
#import <objc/runtime.h>
@implementation addSelector
//默认方法有两个隐式参数
void eat(id self,SEL sel)
{
    NSDictionary *dic = @{@"name":@"ceshi",@"age":@"11"};
    NSLog(@"%@ === %@ %@",self,NSStringFromSelector(sel),dic);
}
//当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传递过来
//刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat)) {
        //动态添加eat方法
        
        //第一个：给哪个类添加方法
        //第二个：添加方法的方法编号
        //第三个：添加方法的函数实现（函数地址）
        //第四个：函数的类型（返回值+参数类型） v:void @：对象->self
        class_addMethod(self, @selector(eat), eat, "v@:");
    }
    return [super resolveClassMethod:sel];
}
@end
