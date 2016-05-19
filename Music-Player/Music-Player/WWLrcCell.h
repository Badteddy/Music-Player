//
//  WWLrcCell.h
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WWLrcLine;
@interface WWLrcCell : UITableViewCell
@property (nonatomic, strong) WWLrcLine *lrcLine;

+ (instancetype)lrcCellWithTableView:(UITableView *)tableView;
@end
