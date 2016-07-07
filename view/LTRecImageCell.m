//
//  LTRecImageCell.m
//  LittleTail
//
//  Created by chunlen on 16/3/30.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "LTRecImageCell.h"
#import "LTPetShowCollectionCell.h"

@interface LTRecImageCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end
@implementation LTRecImageCell

- (void)awakeFromNib {
    // Initialization code
    _flowLayout.minimumInteritemSpacing = 1;
    _flowLayout.minimumLineSpacing = 1;
    
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//设置其布局方向
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置其边界
    CGFloat itemW = (SCREEN_WIDTH - 60)/4;
    _flowLayout.itemSize = CGSizeMake(itemW, itemW);
    [_collectionView registerNib:[UINib nibWithNibName:@"LTPetShowCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"LTPetShowCollectionCell3"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"LTPetShowCollectionCell3";
    LTPetShowCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.goupic.com/wp-content/uploads/2012/09/chongwugou_tupian-daquan022-1024x682.jpg"]];
    cell.imageCountLabel.hidden = YES;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
