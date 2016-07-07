//
//  LTCompleteUserInfoVC.h
//  LittleTail
//
//  Created by chunlen on 16/3/2.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DCAnimationCardDelegate <NSObject>
- (void)likeAtIndex:(NSInteger)index;
- (void)disLikeAtIndex:(NSInteger)index;
- (void)viewDetailsAtIndex:(NSInteger)index;
- (void)ignor;
@end
@interface DCAnimationCards : UIView
@property(nonatomic, weak) id <DCAnimationCardDelegate> delegate;
- (id)initWithCards:(NSArray*)cards;
- (void)show;

@end
