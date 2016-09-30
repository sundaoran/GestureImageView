//
//  sun_photoAlbums.h
//  NSMProject
//
//  Created by xiayu on 16/5/24.
//  Copyright © 2016年 Wenyu. All rights reserved.
//


//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface sun_photoAlbums : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSMutableArray   *imageArray;

+(void)showImageArray:(NSMutableArray *)imageArray andIndex:(NSInteger)Index;

@end
