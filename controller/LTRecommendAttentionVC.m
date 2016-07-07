//
//  LTRecommendAttentionVC.m
//  LittleTail
//
//  Created by chunlen on 16/3/3.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "LTRecommendAttentionVC.h"
#import "DCAnimationCards.h"
#import "LTRecommendDetailVC.h"
#import "DMScaleTransition.h"
@interface LTRecommendAttentionVC ()<DCAnimationCardDelegate>

@end

@implementation LTRecommendAttentionVC

- (void)initUI{
//    self.navTitle = @"推荐关注";
    self.view.backgroundColor = MAIN_COLOR;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [arr addObject:RGBA_COLOR(arc4random() % 255, arc4random() % 255, arc4random() % 255, 1)];
    }
    DCAnimationCards *cards = [[DCAnimationCards alloc]initWithCards:arr];
    cards.delegate = self;
    //    [cards show];
    [self.view addSubview:cards];
    // Do any additional setup after loading the view.
}
#pragma - mark - DCAnimationCardDelegate
- (void)likeAtIndex:(NSInteger)index{//喜欢
    Log(@"喜欢%ld",(long)index);
}
- (void)disLikeAtIndex:(NSInteger)index{//不喜欢
    Log(@"不喜欢%ld",(long)index);
}
- (void)viewDetailsAtIndex:(NSInteger)index{
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    transition.type = @"oglFlip";
//    transition.subtype = kCATransitionFromTop;
//    transition.delegate = self;
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    LTRecommendDetailVC *firstViewController = [[LTRecommendDetailVC alloc]init];
//    DMScaleTransition *scaleTransition = [[DMScaleTransition alloc]init];
//    [firstViewController setTransitioningDelegate:scaleTransition];
//    [self presentViewController:firstViewController animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:firstViewController animated:NO];
}
- (void)ignor
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
