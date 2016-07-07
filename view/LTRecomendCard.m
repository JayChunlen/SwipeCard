//
//  LTRecomendCard.m
//  LittleTail
//
//  Created by chunlen on 16/3/11.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "LTRecomendCard.h"

@implementation LTRecomendCard

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _provinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, frame.size.height - 35, 100, 20)];
        _provinceLabel.text = @"广东深圳";
        _provinceLabel.font = [UIFont systemFontOfSize:15];
        [_provinceLabel sizeToFit];
        
        _provinceLabel.textColor = [UIColor grayColor];
        [self addSubview:_provinceLabel];
        
        _petNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_provinceLabel.x + _provinceLabel.width+ 20, _provinceLabel.y, 100, 20)];
        _petNameLabel.text = @"阿拉斯加";
        _petNameLabel.font = [UIFont systemFontOfSize:15];
        [_petNameLabel sizeToFit];
        _petNameLabel.textColor = [UIColor grayColor];
        [self addSubview:_petNameLabel];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_provinceLabel.x, frame.size.height - (frame.size.height - _provinceLabel.y + 30), 200, 20)];
        _nameLabel.text = @"Caca";
        [_nameLabel sizeToFit];
        [self addSubview:_nameLabel];
        
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, frame.size.width - 20, frame.size.height - (frame.size.height - _nameLabel.y + 25))];
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.layer.cornerRadius = 4.0f;
        _userImageView.clipsToBounds = YES;
//        _userImageView.backgroundColor = [UIColor redColor];
        _userImageView.userInteractionEnabled = YES;
        [self addSubview:_userImageView];
        
        _petImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 80, _userImageView.y + _userImageView.height - 25, 50, 50)];
        _petImageView.backgroundColor = [UIColor orangeColor];
        _petImageView.layer.cornerRadius = _petImageView.width *.5;
        _petImageView.clipsToBounds = YES;
        [self addSubview:_petImageView];

    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
