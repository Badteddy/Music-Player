//
//  WWLrcCell.m
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "WWLrcCell.h"
#import "WWLrcLine.h"
static NSString *_identifier = @"WWLrcCell";
@implementation WWLrcCell


+ (instancetype)lrcCellWithTableView:(UITableView *)tableView
{
    WWLrcCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:_identifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont systemFontOfSize:13];
        self.textLabel.numberOfLines = 0;
    }
    return self;
}

- (void)setLrcLine:(WWLrcLine *)lrcLine
{
    _lrcLine = lrcLine;
    self.textLabel.text = lrcLine.word;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.bounds = self.bounds;
}

@end
