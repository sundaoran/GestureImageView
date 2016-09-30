//
//  sun_photoAlbums.m
//  NSMProject
//
//  Created by xiayu on 16/5/24.
//  Copyright © 2016年 Wenyu. All rights reserved.
//

#import "sun_photoAlbums.h"
#import "sun_photoAlbumCell.h"

@implementation sun_photoAlbums
{
    UIView              *_bgView;
    UICollectionView    *_collectionView;
    UILabel             *_pageLbl;
}

+(sun_photoAlbums *)sharedPhotoAlbums
{
    static sun_photoAlbums *photoAlbums = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        photoAlbums = [[self alloc] init];
    });
    return photoAlbums;
}

+(void)showImageArray:(NSMutableArray *)imageArray andIndex:(NSInteger)Index
{
    [[self sharedPhotoAlbums]showImageArray:imageArray andIndex:Index];
}

-(void)showImageArray:(NSMutableArray *)imageArray andIndex:(NSInteger)Index
{
    if(![imageArray count])
    {
        return;
    }
    self.imageArray=[[NSMutableArray alloc]initWithArray:imageArray];
    if(!_bgView)
    {
        _bgView=[[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.9];
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(ScreenWidth, ScreenHeight);
        flowLayout.minimumInteritemSpacing=0;
        flowLayout.minimumLineSpacing=0;
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.pagingEnabled=YES;
        _collectionView.backgroundColor=[UIColor clearColor];
        _collectionView.scrollEnabled=YES;
        _collectionView.showsHorizontalScrollIndicator=NO;
        _collectionView.showsVerticalScrollIndicator=NO;
        [_bgView addSubview:_collectionView];
        [_collectionView registerClass:[sun_photoAlbumCell class] forCellWithReuseIdentifier:@"cell"];
        
        _pageLbl=[[UILabel alloc]init];
        _pageLbl.textAlignment=NSTextAlignmentCenter;
        _pageLbl.textColor=[UIColor whiteColor];
        _pageLbl.backgroundColor=[UIColor clearColor];
        _pageLbl.font=[UIFont systemFontOfSize:20];
        _pageLbl.frame=CGRectMake(0,ScreenHeight-50, ScreenWidth, 50);
        [_bgView addSubview:_pageLbl];
    }
    else
    {
        [_collectionView reloadData];
    }
    
    _pageLbl.text=[NSString stringWithFormat:@"%ld/%ld",Index+1,(unsigned long)[self.imageArray count]];
    
    if(Index>=0)
    {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:Index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
    UIWindow *keyWindows=[UIApplication sharedApplication].keyWindow;
    [keyWindows addSubview:_bgView];
    _bgView.alpha=0;
    _bgView.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [UIView animateWithDuration:0.3f animations:^{
        _bgView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}


-(void)disMissPhotoAlbums
{
    [UIView animateWithDuration:0.3f animations:^{
        _bgView.alpha=0;
    } completion:^(BOOL finished) {
        [_bgView removeFromSuperview];
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    sun_photoAlbumCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if(!cell)
    {
        cell=[[sun_photoAlbumCell alloc]initWithFrame:CGRectZero];
    }
    
    [cell setShowImageDict:[self.imageArray objectAtIndex:indexPath.row]];
    [cell setHiddenShowView:^{
        [self disMissPhotoAlbums];
    }];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page=scrollView.contentOffset.x/ScreenWidth;
    _pageLbl.text=[NSString stringWithFormat:@"%ld/%ld",page+1,(unsigned long)[self.imageArray count]];
}

@end
