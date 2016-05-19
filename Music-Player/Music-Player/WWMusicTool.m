//
//  WWMusicTool.m
//  Music-Player
//
//  Created by King on 16/3/19.
//  Copyright © 2016年 King. All rights reserved.
//

#import "WWMusicTool.h"
#import "WWMusic.h"
#import "MJExtension.h"


static NSArray *_musics;
static WWMusic *_playingMusic;

@implementation WWMusicTool

+ (NSArray *)musics
{
    if (_musics == nil) {
        _musics = [WWMusic objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}

+ (WWMusic *)playingMusic
{
    return _playingMusic;
}

+ (void)setPlayingMusic:(WWMusic *)playingMusic
{
    if (playingMusic == nil || ![_musics containsObject:playingMusic] || playingMusic == _playingMusic) {
        return;
    }
    _playingMusic = playingMusic;
}


+ (WWMusic *)nextMusic
{
    int nextIndex = 0;
    if (_playingMusic) {
        int playingIndex = (int)[[self musics] indexOfObject:_playingMusic];
        nextIndex = playingIndex + 1;
        if (nextIndex >= [self musics].count) {
            nextIndex = 0;
        }
    }
    return [self musics][nextIndex];
}

+ (WWMusic *)previousMusic
{
    int previousIndex = 0;
    if (_playingMusic) {
        int playingIndex = (int)[[self musics] indexOfObject:_playingMusic];
        previousIndex = playingIndex - 1;
        if (previousIndex < 0) {
            previousIndex = (int)[self musics].count - 1;
        }
    }
    return [self musics][previousIndex];
}


@end
