//
//  NSString+Additions.h
//  iFramework
//
//  Created by JiangHaoyuan on 13-10-8.
//  Copyright (c) 2013年 JiangHaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(Additions)

+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes;

+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes andCGSizeWidth:(CGFloat)width;


@end
