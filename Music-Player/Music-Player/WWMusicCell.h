//
//  WWMusicCell.h
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WWMusic;
@interface WWMusicCell : UITableViewCell
@property (nonatomic, strong) WWMusic *music;

+ (instancetype)musicCellWithTableView:(UITableView *)tableView;
@end
