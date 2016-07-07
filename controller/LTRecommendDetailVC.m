//
//  LTRecommendDetailVC.m
//  LittleTail
//
//  Created by chunlen on 16/3/28.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "LTRecommendDetailVC.h"
#import "LTRecUserCell.h"
#import "LTPetCell.h"
#import "LTRecImageCell.h"
@interface LTRecommendDetailVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LTRecommendDetailVC
- (void)initUI{
    self.view.backgroundColor = MAIN_COLOR;

    _tableView.layer.cornerRadius = 5.0f;
    _tableView.clipsToBounds = YES;
    [_tableView registerNib:[UINib nibWithNibName:@"LTRecUserCell" bundle:nil] forCellReuseIdentifier:@"LTRecUserCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"LTPetCell" bundle:nil] forCellReuseIdentifier:@"LTPetCell1"];
    [_tableView registerNib:[UINib nibWithNibName:@"LTRecImageCell" bundle:nil] forCellReuseIdentifier:@"LTRecImageCell"];
    _tableView.tableFooterView = [[UIView alloc] init];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma - mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 300;
    }else if (indexPath.row == 1){
        return 80;
    }
    return SCREEN_WIDTH /4 * 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        LTRecUserCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"LTRecUserCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.hinews.cn/pic/0/12/07/58/12075821_793826.jpg"]];
        return cell;
    }else if (indexPath.row == 1) {
        LTPetCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"LTPetCell1"];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.petImageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.goupic.com/wp-content/uploads/2012/09/chongwugou_tupian-daquan022-1024x682.jpg"]];
        return cell;
    }else{
        LTRecImageCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"LTRecImageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
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
