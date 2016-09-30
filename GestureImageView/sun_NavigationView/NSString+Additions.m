//
//  NSString+Additions.m
//  iFramework
//
//  Created by JiangHaoyuan on 13-10-8.
//  Copyright (c) 2013年 JiangHaoyuan. All rights reserved.
//

#import "NSString+Additions.h"


#define Interval @"Interval"  //距离当前时间的时间间隔
#define TimeStamp @"TimeStamp" //时间戳

@implementation NSString(Additions)




//动态获取高度
+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes
{
    CGRect rect;
    CGSize retSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        if(attributes)
        {
            NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]initWithDictionary:attributes];
            if(![tempDict objectForKey:NSParagraphStyleAttributeName])
            {
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
                paragraphStyle.lineSpacing=0;
                [tempDict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
            }
            rect=[string boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:tempDict context:nil];
        }
        else
        {
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            paragraphStyle.lineSpacing=0;
            rect=[string boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        }
        if(![string isEqualToString:@""])
        {
            return rect;
        }
        else
        {
            return CGRectMake(0, 0, rect.size.width, 0);
        }
        
    }
    else
    {
        if(attributes)
        {
            NSMutableParagraphStyle *paragraphStyle= [attributes objectForKey:NSParagraphStyleAttributeName];
            if(!paragraphStyle)
            {
                paragraphStyle=[[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            }
            retSize = [string sizeWithFont:[attributes objectForKey:NSFontAttributeName] constrainedToSize:CGSizeMake(200, 1000) lineBreakMode:paragraphStyle.lineBreakMode];
        }
        else
        {
            retSize = [string sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(200, 1000) lineBreakMode:NSLineBreakByCharWrapping];
            
        }
        if(![string isEqualToString:@""])
        {
            return CGRectMake(0, 0, retSize.width, retSize.height);
        }
        else
        {
            return CGRectMake(0, 0, 0, 0);
        }
    }
}


+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes andCGSizeWidth:(CGFloat)width
{
    CGRect rect;
    CGSize retSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        if(attributes)
        {
            NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]initWithDictionary:attributes];
            if(![tempDict objectForKey:NSParagraphStyleAttributeName])
            {
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
                paragraphStyle.lineSpacing=2;
                [tempDict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
            }
            rect=[string boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:tempDict context:nil];
        }
        else
        {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            paragraphStyle.lineSpacing=2;
            rect=[string boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        }
        if(![string isEqualToString:@""])
        {
            return rect;
        }
        else
        {
            return CGRectMake(0, 0, rect.size.width+0.1, 0);
        }
        
    }
    else
    {
        if(attributes)
        {
            NSMutableParagraphStyle *paragraphStyle= [attributes objectForKey:NSParagraphStyleAttributeName];
            if(!paragraphStyle)
            {
                paragraphStyle=[[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            }
            retSize = [string sizeWithFont:[attributes objectForKey:NSFontAttributeName] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:paragraphStyle.lineBreakMode];
        }
        else
        {
            retSize = [string sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByCharWrapping];
            
        }
        if(![string isEqualToString:@""])
        {
            return CGRectMake(0, 0, retSize.width+0.1, retSize.height+0.1);
        }
        else
        {
            return CGRectMake(0, 0, 0, 0);
        }
    }
}

@end
