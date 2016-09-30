//
//  navigationBarViewController.m
//  GestureImageView
//
//  Created by ios developer on 16/9/30.
//  Copyright © 2016年 sundaoran. All rights reserved.
//

#import "navigationBarViewController.h"
#import "sun_NavigationView.h"

@interface navigationBarViewController ()

@end

@implementation navigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    if(1)
    {
    sun_NavigationView *nav=[[sun_NavigationView alloc]initWithTitle:@"自定义导航栏" andLeftImage:@"返回" andRightImage:@"更多" andLeftAction:^{
        [self.navigationController popViewControllerAnimated:YES];
    } andRightAction:^{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"右键操作" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];
    }];
    [self.view addSubview:nav];
    }
    else  //添加对应图片
    {
        sun_NavigationView *nav=[[sun_NavigationView alloc]initWithTitle:@"自定义导航栏" andLeftImage:[UIImage imageNamed:@"btn_back"] andRightImage:[UIImage imageNamed:@"btn_menu"] andLeftAction:^{
            [self.navigationController popViewControllerAnimated:YES];
        } andRightAction:^{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"右键操作" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
            [alert show];
        }];
        [self.view addSubview:nav];
    }
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
