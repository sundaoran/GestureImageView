//
//  ViewController.m
//  GestureImageView
//
//  Created by sundaoran on 16/9/30.
//  Copyright © 2016年 sundaoran. All rights reserved.
//

#import "ViewController.h"
#import "navigationBarViewController.h"
#import "singleClickImageViewViewController.h"
#import "photoAlbumsViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
    UITableView *_tableView;
    NSArray  *_dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray=@[@"自定义导航栏",@"单个图片手势操作",@"相册手势操作"];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[_dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            navigationBarViewController *nav=[[navigationBarViewController alloc]init];
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
        case 1:
        {
            singleClickImageViewViewController *singleClickImage=[[singleClickImageViewViewController alloc]init];
            [self.navigationController pushViewController:singleClickImage animated:YES];
        }
            break;
        case 2:
        {
            photoAlbumsViewController *photoAlbums=[[photoAlbumsViewController alloc]init];
            [self.navigationController pushViewController:photoAlbums animated:YES];
        }
            break;
            
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
