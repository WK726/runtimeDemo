//
//  ViewController.m
//  分享
//
//  Created by 王开 on 2019/3/25.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Cat.h"
#import "privateProperty.h"
#import "addSelector.h"
#import "UIGestureRecognizer+Block.h"
#import "NSObject+property.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //访问私有属性
    [self privateProperty];
    
    //动态添加方法
//    [self addSelector];
    
    //手势
//    [self gesture];
//    [self gestureNormal];

    //类别属性
//    [self categoryProperty];
    
    //方法交换
//    [self methodSwizzling];
}
//jsonToModel
-(void)jsonToModel{
    NSDictionary *dict = @{@"cid":@"猫咪",@"age":@"12"};
    Cat *cat = [Cat modelWithDict:dict];
    NSLog(@"cid = %@ age = %@",cat.cid,cat.age);
}
//privateProperty
-(void)privateProperty
{   privateProperty *person = [[privateProperty alloc] init];
    //参数1写目标类的名称，2目标属性的名称
    Ivar ivar = class_getInstanceVariable([person class], "_bodyData");
    //获取数据
    id bodydata = object_getIvar(person, ivar);
    NSLog(@"privateProperty == %@",bodydata);
}
//addSelector
-(void)addSelector{
    addSelector *p = [[addSelector alloc] init];
    
    //默认addSelector,没有实现eat方法，可以通过performSelector调用，但是会报错
    //动态添加方法就不会报错
    [p performSelector:@selector(eat)];
}
//gesture
-(void)gesture{
    [self.view addGestureRecognizer:[UITapGestureRecognizer wk_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        NSLog(@"点击-------");
    }]];
}
-(void)gestureNormal{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [self.view addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(gestureClick)];
}
-(void)gestureClick
{
    NSLog(@"normal-------");
}
//categoryProperty
-(void)categoryProperty
{
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"kaikai";
    NSLog(@"%@",objc.name);
}
//methodSwizzling
-(void)methodSwizzling
{
    UIImage *image = [UIImage imageNamed:@"123"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
