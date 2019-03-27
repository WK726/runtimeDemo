//
//  NSObject+Extension.h
//  分享
//
//  Created by 王开 on 2019/3/26.
//  Copyright © 2019年 com.wk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
+(NSArray *)ignoredNames;
+(void)encodeWithCoder:(NSCoder *)aCoder;
@end
