//
//  sun_photoAlbumCell.m
//  NSMProject
//
//  Created by xiayu on 16/5/24.
//  Copyright © 2016年 Wenyu. All rights reserved.
//

#import "sun_photoAlbumCell.h"
#import <UIImageView+WebCache.h>

@implementation sun_photoAlbumCell
{
    UIScrollView    *_scrollView;
    UIImageView     *_imageView;
    UIActivityIndicatorView *_activityIndicatorView;
    NSMutableDictionary *_imageDict;
}



-(void)setShowImageDict:(NSMutableDictionary *)imageDict
{
    _imageDict=imageDict;
    [_activityIndicatorView startAnimating];
    
    [_imageView sd_setImageWithURL:[imageDict objectForKey:@"image"] placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [_activityIndicatorView stopAnimating];
        if(!error)
        {
            _imageView.image=image;
            [self adjustFrame];
        }
    }];
    
    //    [self addGertureForImage:_imageView.image];
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        _scrollView.userInteractionEnabled = YES;
        _scrollView.clipsToBounds = YES;
        _scrollView.delegate=self;
        _scrollView.contentMode = UIViewContentModeScaleAspectFill;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_scrollView setContentSize:CGSizeMake(0, 0)];
        [self.contentView addSubview:_scrollView];
        
        _imageView=[[UIImageView alloc]initWithFrame:_scrollView.frame];
        _imageView.contentMode=UIViewContentModeScaleAspectFit;
        _imageView.image=[UIImage imageNamed:@"nsm_logo"];
        [_scrollView addSubview:_imageView];
        
        _activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.center=_scrollView.center;
        [self.contentView addSubview:_activityIndicatorView];
        
        
        UITapGestureRecognizer *tapone=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage)];
        [tapone setNumberOfTapsRequired:1];
        [_scrollView addGestureRecognizer:tapone];
        
        UITapGestureRecognizer *tapdouble=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scaleClick:)];
        [tapdouble setNumberOfTapsRequired:2];
        [_scrollView addGestureRecognizer:tapdouble];
        
         [tapone requireGestureRecognizerToFail:tapdouble];
        
        [self adjustFrame];
    }
    return self;
}

-(void)hideImage
{
    self.hiddenShowView();
}

-(void)adjustFrame
{
    [_scrollView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    // 基本尺寸参数
    
    CGFloat boundsWidth = ScreenWidth;
    CGFloat boundsHeight = ScreenHeight;
    
    CGSize imageSize = _imageView.image.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    
    // 设置伸缩比例
    CGFloat widthRatio = boundsWidth/imageWidth;
    CGFloat heightRatio = boundsHeight/imageHeight;
    CGFloat minScale = (widthRatio > heightRatio) ? heightRatio : widthRatio;
    
    if (minScale >= 1) {
        minScale = 0.7;
    }
    
    CGFloat maxScale = 1.5;
    
    _scrollView.maximumZoomScale = maxScale;
    _scrollView.minimumZoomScale = minScale;
    _scrollView.zoomScale = minScale;
    
    CGRect imageFrame = CGRectMake(0, 0, boundsWidth, imageHeight * boundsWidth / imageWidth);
    // 内容尺寸
    _scrollView.contentSize = CGSizeMake(0, imageFrame.size.height);
    
    // 宽大
    if ( imageWidth <= imageHeight &&  imageHeight <  boundsHeight ) {
        imageFrame.origin.x = floorf( (boundsWidth - imageFrame.size.width ) / 2.0) * minScale;
        imageFrame.origin.y = floorf( (boundsHeight - imageFrame.size.height ) / 2.0) * minScale;
    }else{
        imageFrame.origin.x = floorf( (boundsWidth - imageFrame.size.width ) / 2.0);
        imageFrame.origin.y = floorf( (boundsHeight - imageFrame.size.height ) / 2.0);
    }
    _imageView.frame=imageFrame;
    _imageView.center=_scrollView.center;
}


// 让UIImageView在UIScrollView缩放后居中显示
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    _imageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                    scrollView.contentSize.height * 0.5 + offsetY);
}

-(void)scaleClick:(UITapGestureRecognizer*)tap
{
    CGPoint touchPoint = [tap locationInView:_scrollView];
    if (_scrollView.zoomScale == _scrollView.maximumZoomScale) {
        [_scrollView setZoomScale:_scrollView.minimumZoomScale animated:YES];
    } else {
        [_scrollView zoomToRect:CGRectMake(touchPoint.x, touchPoint.y, 1, 1) animated:YES];
    }
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
