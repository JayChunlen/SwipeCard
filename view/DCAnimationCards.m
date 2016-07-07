//
//  LTCompleteUserInfoVC.h
//  LittleTail
//
//  Created by chunlen on 16/3/2.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "DCAnimationCards.h"
#import "LTRecomendCard.h"
@interface DCAnimationCards ()
{
    NSArray *_cardArr;
    CGPoint _tmpPoint;
    NSInteger _currentIndex;
    UIButton *leftbutton;
    UIButton *rbutton;
}

@property (nonatomic, strong) UIView *bgView;

@end

@implementation DCAnimationCards

- (id)initWithCards:(NSArray*)cards {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, TOPBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - TOPBAR_HEIGHT);
        self.backgroundColor = [UIColor clearColor];
        _cardArr = [[NSArray alloc]initWithArray:cards];
        [self drawView];
    }
    return self;
}

- (void)drawView {
    _bgView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TOPBAR_HEIGHT)];
    [self addSubview:_bgView];
    
    [self drawCardsZone];

//    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
//    [_bgView addGestureRecognizer:pan];
    
    leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(20, SCREEN_HEIGHT - 64 - 80, 80, 80);
    [leftbutton setImage:[UIImage imageNamed:@"tool_button_dislike"] forState:UIControlStateNormal];
    leftbutton.tag = 10000;
    [leftbutton addTarget:self action:@selector(likeOrDislike:) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:leftbutton];
    rbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rbutton.frame = CGRectMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 64 - 80, 80, 80);
    [rbutton setImage:[UIImage imageNamed:@"tool_button_like"] forState:UIControlStateNormal];
    rbutton.tag = 10001;
    [rbutton addTarget:self action:@selector(likeOrDislike:) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:rbutton];
    
    UIButton *midButton = [UIButton buttonWithType:UIButtonTypeCustom];
    midButton.frame = CGRectMake(SCREEN_WIDTH *0.5- 20, SCREEN_HEIGHT - 64 - 55, 40, 40);
    [midButton setTitle:@"跳过" forState:UIControlStateNormal];
    [midButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    midButton.tag = 10002;
    [midButton addTarget:self action:@selector(likeOrDislike:) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:midButton];
    
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    self.backgroundColor = [UIColor clearColor];
    _bgView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);

    [UIView animateWithDuration:.3f animations:^{
        _bgView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5f];
    }];
}

- (void)drawCardsZone {
    for (int i = ((int)_cardArr.count-1); i >= 0; i --) {
        int j;
        LTRecomendCard *cardView = [[LTRecomendCard alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, SCREEN_HEIGHT-180)];
        [cardView.userImageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.hinews.cn/pic/0/12/07/58/12075821_793826.jpg"]];
        cardView.tag = 100+i;
        cardView.layer.cornerRadius = 4.f;
        cardView.layer.masksToBounds = YES;
        cardView.layer.borderWidth = 0.5f;
        cardView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        j = MIN(i, 2);
        cardView.transform = CGAffineTransformMakeScale(1-0.07*j, 1-0.07*j);
        cardView.transform = CGAffineTransformTranslate(cardView.transform, 0, j*14*2);
        cardView.backgroundColor = [UIColor whiteColor];//_cardArr[i];
        _tmpPoint = cardView.center;
        [_bgView addSubview:cardView];
        
        UIView *whiteView = [[UIView alloc]initWithFrame:cardView.bounds];
        whiteView.tag = 201;
        whiteView.backgroundColor = [UIColor whiteColor];
        whiteView.alpha = i == 0 ? 0:.7;
        [cardView addSubview:whiteView];
        
        UITapGestureRecognizer *tapViewD = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDetail:)];
        [cardView addGestureRecognizer:tapViewD];
    }
    _currentIndex = 0;
}


CGPoint beginPoint1;
BOOL cantM1;
UIView *dragObj;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    dragObj = [_bgView viewWithTag:100+_currentIndex];
    beginPoint1 = [touch locationInView:dragObj];
    CGPoint startPoint = [touch locationInView:self];
    Log(@"起始点%@",NSStringFromCGPoint(beginPoint1));
    if ((startPoint.y<dragObj.y) || (startPoint.y > (dragObj.y+dragObj.height))) {
        cantM1 = YES;
    }else{
        cantM1 = NO;
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    CGPoint touchPoint = [touch locationInView:dragObj];
    
    Log(@"当前触点%@",NSStringFromCGPoint(touchPoint));
    ;
    
    if (cantM1) {
        return;
    }
    Log(@"移动");
    CGPoint curCenter = CGPointMake(dragObj.center.x +touchPoint.x-beginPoint1.x, dragObj.center.y +touchPoint.y-beginPoint1.y);
    dragObj.center = curCenter;
    Log(@"相减：%f",dragObj.center.x - _tmpPoint.x);
    if (dragObj.center.x - _tmpPoint.x>0) {
        [UIView animateWithDuration:.3f animations:^{
            rbutton.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        }];
        [UIView animateWithDuration:.3f animations:^{
            leftbutton.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    }else{
        [UIView animateWithDuration:.3f animations:^{
            leftbutton.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        }];
        [UIView animateWithDuration:.3f animations:^{
            rbutton.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];

    }
    
    
        Log(@"touchMoved");
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (dragObj.center.x - _tmpPoint.x>0) {
        [UIView animateWithDuration:.3f animations:^{
            rbutton.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    }else{
        [UIView animateWithDuration:.3f animations:^{
            leftbutton.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    }
    if (ABS(dragObj.center.x - _tmpPoint.x)>100) {
        
        if ((dragObj.center.x - _tmpPoint.x)<0) {
            if ([self.delegate respondsToSelector:@selector(disLikeAtIndex:)]) {
                [self.delegate disLikeAtIndex:_currentIndex];
            }
        }else{
            if ([self.delegate respondsToSelector:@selector(likeAtIndex:)]) {
                [self.delegate likeAtIndex:_currentIndex];
            }
        }
        
        
        [self removeCard:dragObj lastPoint:CGPointMake(((dragObj.center.x - _tmpPoint.x)<0?-dragObj.width*0.5:(SCREEN_WIDTH+dragObj.width*0.5)), dragObj.center.y)];
    }else{
        [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            dragObj.center = _tmpPoint;
        } completion:nil];
    }
    
    
}


//手势拖拽
//-(void)panHandle:(UIPanGestureRecognizer *)pan {
//    if (pan.state == UIGestureRecognizerStateBegan) {
//        Log(@"start");
//    }
//    else if (pan.state == UIGestureRecognizerStateChanged) {
//        CGPoint offset = [pan translationInView:_bgView];
//        UIView *dragObj = [_bgView viewWithTag:100+_currentIndex];
//        [dragObj setCenter:CGPointMake(dragObj.center.x + offset.x, dragObj.center.y + offset.y)];
//        [pan setTranslation:CGPointMake(0, 0) inView:_bgView];
//        Log(@"停止中心点%@",NSStringFromCGPoint(dragObj.center));
//        
//    }
//    else if (pan.state == UIGestureRecognizerStateEnded) {
//        CGPoint last = [pan velocityInView:_bgView];
//        CGPoint offset = [pan translationInView:_bgView];
//
//        UIView *dragObj = [_bgView viewWithTag:100+_currentIndex];
//        Log(@"结束点%@ 被拽view中心点%@  偏移量：%@",NSStringFromCGPoint(last),NSStringFromCGPoint(dragObj.center),NSStringFromCGPoint(offset));
//
//        if (last.x > 1500 || last.x < -1500) {
//            [self removeCard:dragObj lastPoint:last];
//        }
//        else {
//            
//            if (dragObj.center.x<SCREEN_WIDTH *.25) {
//                [self removeCard:dragObj lastPoint:last];
//            }else if (dragObj.center.x>SCREEN_WIDTH *.75){
//                [self removeCard:dragObj lastPoint:last];
//            }
//            
//            [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                dragObj.center = _tmpPoint;
//            } completion:nil];
//        }
//    }
//}
- (void)removeCard:(UIView *)view lastPoint:(CGPoint)last{
    [UIView animateWithDuration:.2 animations:^{
        view.center = CGPointMake(last.x, last.y);
        view.alpha = 0;

        _currentIndex++;
        [self reloadCardsView];
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}
- (void)reloadCardsView {
    if (_currentIndex == _cardArr.count) {
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if ([self.delegate respondsToSelector:@selector(ignor)]) {
                [self.delegate ignor];
            }
        }];
    }
    for (int i = 0; i < 3; i++) {
        UIView *cardView = [_bgView viewWithTag:100+_currentIndex+i];
        if (cardView) {
            UIView *whiteView = [cardView viewWithTag:201];
            [UIView animateWithDuration:.3 animations:^{
                cardView.transform = CGAffineTransformMakeScale(1-0.07*i, 1-0.07*i);
                cardView.transform = CGAffineTransformTranslate(cardView.transform, 0, i*14*2);
                whiteView.alpha = i == 0? 0:.7;
            }];
        }
    }
}

- (void)likeOrDislike:(UIButton *)sender{
    UIView *dragObj = [_bgView viewWithTag:100+_currentIndex];

    if (sender.tag == 10000) {//左
        [UIView animateWithDuration:.3 animations:^{
            dragObj.center = CGPointMake(-SCREEN_WIDTH*.5, 100);
            dragObj.alpha = 0;
            if ([self.delegate respondsToSelector:@selector(disLikeAtIndex:)]) {
                [self.delegate disLikeAtIndex:_currentIndex];
            }
            _currentIndex++;
            [self reloadCardsView];
        } completion:^(BOOL finished) {
            [dragObj removeFromSuperview];
        }];
    }else if (sender.tag == 10001) {//右
        [UIView animateWithDuration:.3 animations:^{
            dragObj.center = CGPointMake(SCREEN_WIDTH*1.5, 100);
            dragObj.alpha = 0;
            if ([self.delegate respondsToSelector:@selector(likeAtIndex:)]) {
                [self.delegate likeAtIndex:_currentIndex];
            }
            _currentIndex++;
            [self reloadCardsView];
        } completion:^(BOOL finished) {
            [dragObj removeFromSuperview];
        }];

    }else{//中
        if ([self.delegate respondsToSelector:@selector(ignor)]) {
            [self.delegate ignor];
        }
    }
}

- (void)viewDetail:(UIGestureRecognizer *)gesture{
    [self touchesEnded:[NSSet set] withEvent:nil];
    if ([self.delegate respondsToSelector:@selector(viewDetailsAtIndex:)]) {
        [self.delegate viewDetailsAtIndex:gesture.view.tag - 100];
    }
    NSLog(@"点击了view：%ld",(long)gesture.view.tag - 100);
}
@end
