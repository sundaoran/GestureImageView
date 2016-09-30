//
//  singleClickImageViewViewController.m
//  GestureImageView
//
//  Created by ios developer on 16/9/30.
//  Copyright © 2016年 sundaoran. All rights reserved.
//

#import "singleClickImageViewViewController.h"
#import "sun_NavigationView.h"
#import "ClickImageView.h"
#import "showImageInScroll.h"

@interface singleClickImageViewViewController ()

@end

@implementation singleClickImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    sun_NavigationView *nav=[[sun_NavigationView alloc]initWithTitle:@"单个图片手势操作" andLeftImage:[UIImage imageNamed:@"btn_back"] andRightImage:nil andLeftAction:^{
        [self.navigationController popViewControllerAnimated:YES];
    } andRightAction:^{
        
    }];
    [self.view addSubview:nav];
    
    //一行代码集成图片下载
    ClickImageView *imageView=[[ClickImageView alloc]initWithImage:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3691227676,2621384813&fm=116&gp=0.jpg" andFrame:CGRectMake(0, 0, 200, 200) andplaceholderImage:[UIImage imageNamed:@"default"] andCkick:^(UIImageView *imageView) {
        [[showImageInScroll sharedshowScroll]showImage:imageView];
    }];
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
    
    /*
     更新下载地址
    [imageView setImageUrl:@"" andimageClick:^(UIImageView *imageView) {
        
    }];
     */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
