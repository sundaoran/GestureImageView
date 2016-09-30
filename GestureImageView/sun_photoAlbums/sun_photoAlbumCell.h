//
//  sun_photoAlbumCell.h
//  NSMProject
//
//  Created by xiayu on 16/5/24.
//  Copyright © 2016年 Wenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sun_photoAlbumCell : UICollectionViewCell<UIScrollViewDelegate>


@property(nonatomic,strong)void(^hiddenShowView)();

-(void)setShowImageDict:(NSMutableDictionary *)imageDict;

@end
