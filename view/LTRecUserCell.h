//
//  LTRecUserCell.h
//  LittleTail
//
//  Created by chunlen on 16/3/30.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTRecUserCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UIButton *disLikeBtn;
@property (strong, nonatomic) IBOutlet UIButton *likeBtn;

@end
