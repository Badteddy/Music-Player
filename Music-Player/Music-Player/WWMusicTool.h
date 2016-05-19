//
//  WWMusicTool.h
//  Music-Player
//
//  Created by King on 16/3/19.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWMusic;
@interface WWMusicTool : NSObject
/**
 *  正在播放的歌曲
 *
 */
+ (WWMusic *)playingMusic;
/**
 *  重新设置歌曲
 *
 */
+ (void)setPlayingMusic:(WWMusic *)playingMusic;

/**
 *
 *
 *  @return 所有歌曲
 */
+ (NSArray *)musics;

/**
 *
 *  下一首歌曲
 */
+ (WWMusic *)nextMusic;

/**
 *  上一首歌曲
 *
 */
+ (WWMusic *)previousMusic;
@end
