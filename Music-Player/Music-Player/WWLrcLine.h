//
//  WWLrcLine.h
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWMusic;
@interface WWLrcLine : NSObject
/**
 *  时间点
 */
@property (nonatomic, copy) NSString *time;
/**
 *  词
 */
@property (nonatomic, copy) NSString *word;
/**
 *  返回所有的歌词model
 *
 */
+ (NSMutableArray *)lrcLinesWithFileName:(NSString *)fileName;
@end
