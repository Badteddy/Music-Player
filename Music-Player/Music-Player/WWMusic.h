//
//  WWMusic.h
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWMusic : NSObject
/**
 *  歌曲名字
 */
@property (copy, nonatomic) NSString *name;
/**
 *  歌曲大图
 */
@property (copy, nonatomic) NSString *icon;
/**
 *  歌曲的文件名
 */
@property (copy, nonatomic) NSString *filename;
/**
 *  歌词的文件名
 */
@property (copy, nonatomic) NSString *lrcname;
/**
 *  歌手
 */
@property (copy, nonatomic) NSString *singer;
/**
 *  歌手图标
 */
@property (copy, nonatomic) NSString *singerIcon;

@property (assign, nonatomic, getter = isPlaying) BOOL playing;
@end
