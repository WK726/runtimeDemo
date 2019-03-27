//
//  privateProperty.m
//  分享
//
//  Created by 王开 on 2019/3/27.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import "privateProperty.h"
@interface privateProperty()
@property(nonatomic,copy) NSString *phoneNumber;
@property(nonatomic,strong) NSDictionary *bodyData;
@end
@implementation privateProperty
- (instancetype)init
{
    self = [super init];
    if (self) {
        _personName = @"Ms.wang";
        _phoneNumber = @"15801277072";
        _bodyData = [[NSDictionary alloc] init];
        _bodyData = @{@"height":@"12",
                      @"weight":@"140"
                      };
    }
    return self;
}
@end
