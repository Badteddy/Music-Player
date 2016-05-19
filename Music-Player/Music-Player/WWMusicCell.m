//
//  WWMusicCell.m
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "WWMusicCell.h"
#import "WWMusic.h"
#import "WWImageTool.h"
#import "Colours.h"

static NSString *_identifier = @"WWMusicCell";

@implementation WWMusicCell
+ (instancetype)musicCellWithTableView:(UITableView *)tableView
{
    WWMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    if (cell == nil) {
        cell = [[WWMusicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:_identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:_identifier]) {
        
    }
    return self;
}

- (void)setMusic:(WWMusic *)music
{
    _music = music;
    self.textLabel.text = music.name;
    self.detailTextLabel.text = music.singer;
    
    if (music.isPlaying) {
        self.imageView.image = [WWImageTool circleImageWithName:music.singerIcon borderWidth:2.0 borderColor:[UIColor eggshellColor]];
    }
    else{
        self.imageView.image = [WWImageTool circleImageWithName:music.singerIcon borderWidth:2.0 borderColor:[UIColor pinkColor]] ;
    }
}





@end
