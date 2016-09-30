//
//  showImageInScroll.h
//  jiShiJiaJiao-Teacher
//
//  Created by sundaoran on 14/11/3.
//  Copyright (c) 2014年 sundaoran. All rights reserved.
//

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface showImageInScroll : NSObject <UIScrollViewDelegate>
{
    int             _imageCount;
    int             _selectIndex;
    NSArray         *_showImageArray;
    UIImage         *_showImage;

    
}

@property(nonatomic,strong)NSArray *showImageArray;
@property(nonatomic,strong)UIImage *showImage;
@property(nonatomic)int imageCount;
@property(nonatomic)int selectIndex;

+ (showImageInScroll *)sharedshowScroll;

-(void)showImage:(UIImageView *)ImageView;

@end
