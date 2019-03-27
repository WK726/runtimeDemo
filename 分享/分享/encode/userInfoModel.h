//
//  userInfoModel.h
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extension.h"
@interface userInfoModel : NSObject<NSCoding>
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSString *gender;
@end
