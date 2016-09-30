//
//  sun_photoAlbums.h
//  NSMProject
//
//  Created by xiayu on 16/5/24.
//  Copyright © 2016年 Wenyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sun_photoAlbums : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSMutableArray   *imageArray;

+(void)showImageArray:(NSMutableArray *)imageArray andIndex:(NSInteger)Index;

@end
