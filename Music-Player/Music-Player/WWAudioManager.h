//
//  WWAudioManager.h
//  Music-Player
//
//  Created by King on 16/3/19.
//  Copyright © 2016年 King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface WWAudioManager : NSObject
+ (instancetype)defaultManager;

//播放音乐
- (AVAudioPlayer *)playingMusic:(NSString *)filename;
- (void)pauseMusic:(NSString *)filename;
- (void)stopMusic:(NSString *)filename;

//播放音效
- (void)playSound:(NSString *)filename;
- (void)disposeSound:(NSString *)filename;

@end
