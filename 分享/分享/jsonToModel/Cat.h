//
//  Cat.h
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject
@property (nonatomic,copy) NSString *cid;
@property (nonatomic,copy) NSString *age;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
