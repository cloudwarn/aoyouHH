//
//  HomeViewController.m
//  aoyouHH
//
//  Created by jinzelu on 15/4/21.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#import "HomeViewController.h"
#import "AttentionView.h"
#import "HotView.h"
#import "NewView.h"
#import "FunView.h"
#import "WordView.h"
#import "JokeViewController.h"
#import "JZAlbumViewController.h"
#import "NetworkSingleton.h"
#import "JokeDetailViewController.h"

@interface HomeViewController ()<HotViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    [self addScrollViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addScrollViews{
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 20)];
    statusBarView.backgroundColor = navigationBarColor;
    [self.view addSubview:statusBarView];
    
    CGRect frame = CGRectMake(0, 20, screen_width, screen_height-49-20);
    UIView *v1 = [AttentionView new];
    HotView *v2 = [[HotView alloc] init];
    UIView *v3 = [NewView new];
    UIView *v4 = [FunView new];
    UIView *v5 = [WordView new];
    v2.delegate = self;
    NSArray *views = @[v1, v2,v3,v4,v5];
//    NSArray *views = @[[AttentionView new],[HotView new],[NewView new],[FunView new],[WordView new]];
//    NSArray *views = @[jokeVC.view,[HotView new],[NewView new],[FunView new],[WordView new]];
    NSArray *names = @[@"关注",@"最火",@"最新",@"趣图",@"文字"];
    //创建
    self.scroll = [XLScrollViewer scrollWithFrame:frame withViews:views withButtonNames:names withThreeAnimation:211];
    self.scroll.xl_topBackColor = navigationBarColor;
    self.scroll.xl_topHeight = 44;
    self.scroll.xl_buttonColorSelected = [UIColor whiteColor];
    self.scroll.xl_buttonColorNormal = [UIColor whiteColor];
    self.scroll.xl_sliderColor = [UIColor whiteColor];
    self.scroll.xl_sliderHeight = 0;
    
    //加入
    [self.view addSubview:self.scroll];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark - HotViewDelegate
-(void)didSelectImage:(NSMutableArray *)imageArr currentIndex:(NSInteger)currentIndex{
    JZAlbumViewController *jzAlbumVC = [[JZAlbumViewController alloc] init];
    jzAlbumVC.imgArr = imageArr;
    jzAlbumVC.currentIndex = currentIndex;
    [self presentViewController:jzAlbumVC animated:YES completion:nil];
}
//选中一行
-(void)didselectRowAtIndexPath:(NSIndexPath *)indexPath jokeData:(JokeModel *)joke{
    JokeDetailViewController *jokeDetailVC = [[JokeDetailViewController alloc] init];
    jokeDetailVC.joke = joke;
    [self.navigationController pushViewController:jokeDetailVC animated:YES];
    [self.navigationController setNavigationBarHidden:NO];
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
