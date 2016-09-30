//
//  customCell.m
//  GestureImageView
//
//  Created by ios developer on 16/9/30.
//  Copyright © 2016年 sundaoran. All rights reserved.
//

#import "customCell.h"
#import "ClickImageView.h"

@implementation customCell
{
    ClickImageView *imageView;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        imageView=[[ClickImageView alloc]initWithImage:nil andFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) andplaceholderImage:[UIImage imageNamed:@"default"] andCkick:^(UIImageView *imageView) {
            
        }];
        imageView.userInteractionEnabled=NO;
        [self.contentView addSubview:imageView];
    }
    return self;
}

-(void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl=imageUrl;
    [imageView setImageUrl:imageUrl andimageClick:nil];
}

@end
