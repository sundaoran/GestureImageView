//
//  photoAlbumsViewController.m
//  GestureImageView
//
//  Created by ios developer on 16/9/30.
//  Copyright © 2016年 sundaoran. All rights reserved.
//

#import "photoAlbumsViewController.h"
#import "sun_photoHeader.h"
#import "customCell.h"
#import "sun_NavigationView.h"

@interface photoAlbumsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation photoAlbumsViewController
{
    UICollectionView *_collectionView;
    NSArray  *_dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    sun_NavigationView *nav=[[sun_NavigationView alloc]initWithTitle:@"相册手势操作" andLeftImage:[UIImage imageNamed:@"btn_back"] andRightImage:nil andLeftAction:^{
        [self.navigationController popViewControllerAnimated:YES];
    } andRightAction:^{
        
    }];
    [self.view addSubview:nav];
    
    _dataArray=@[@{@"image":@"http://d.hiphotos.baidu.com/image/h%3D360/sign=43f9b48fc0fdfc03fa78e5bee43f87a9/8b82b9014a90f603f888de363a12b31bb051ed83.jpg"},
                 @{@"image":@"http://g.hiphotos.baidu.com/image/h%3D360/sign=55ceb69c10ce36d3bd0485360af23a24/fcfaaf51f3deb48f822feb98f51f3a292df57835.jpg"},
                 @{@"image":@"http://b.hiphotos.baidu.com/image/h%3D360/sign=ff34dff8bd389b5027ffe654b537e5f1/a686c9177f3e670900d880193fc79f3df9dc5578.jpg"},
                 @{@"image":@"http://f.hiphotos.baidu.com/image/h%3D360/sign=32fb24d7184c510fb1c4e41c50582528/b8389b504fc2d562308a2af2e51190ef76c66c2b.jpg"},
                 @{@"image":@"http://e.hiphotos.baidu.com/image/h%3D360/sign=7a96faa49c510fb367197191e933c893/b999a9014c086e0681ce8b5600087bf40ad1cb4d.jpg "},
                 @{@"image":@"http://e.hiphotos.baidu.com/image/h%3D360/sign=e1f1a97322a4462361caa364a8237246/0df431adcbef7609c7e54a962cdda3cc7dd99ec9.jpg"},
                 @{@"image":@"http://d.hiphotos.baidu.com/image/h%3D360/sign=7a4c21ecb4fd5266b82b3a129b199799/b21c8701a18b87d6dcf88618050828381f30fd7b.jpg"},
                 @{@"image":@"http://g.hiphotos.baidu.com/image/h%3D360/sign=e763ca26b11bb0519024b52e067ada77/0df3d7ca7bcb0a46bc0b4d3d6963f6246b60af8d.jpg"},
                 @{@"image":@"http://c.hiphotos.baidu.com/image/h%3D360/sign=a2c16d2c347adab422d01d45bbd5b36b/f31fbe096b63f62431b8e7078544ebf81b4ca3c9.jpg"}];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    CGFloat width=ScreenWidth/2;
    CGFloat height=width;
    flowLayout.itemSize=CGSizeMake(width, height);
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.pagingEnabled=NO;
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[customCell class] forCellWithReuseIdentifier:@"cellName"];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    customCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellName" forIndexPath:indexPath];
    cell.imageUrl=[_dataArray[indexPath.row] objectForKey:@"image"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [sun_photoAlbums showImageArray:[[NSMutableArray alloc]initWithArray:_dataArray] andIndex:indexPath.row];
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
