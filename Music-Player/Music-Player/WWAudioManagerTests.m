//
//  ZYAudioManagerTests.m
//  ZYMusicPlayer
//
//  Created by King on 16/3/20.
//  Copyright © 2016年 King. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WWAudioManager.h"
#import <AVFoundation/AVFoundation.h>

@interface ZYAudioManagerTests : XCTestCase
@property (nonatomic, strong) AVAudioPlayer *player;
@end
static NSString *_fileName = @"10405520.mp3";
@implementation ZYAudioManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/**
 *  测试是否为单例，要在并发条件下测试
 */
- (void)testAudioManagerSingle
{
    NSMutableArray *managers = [NSMutableArray array];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        WWAudioManager *tempManager = [[WWAudioManager alloc] init];
        [managers addObject:tempManager];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        WWAudioManager *tempManager = [[WWAudioManager alloc] init];
        [managers addObject:tempManager];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        WWAudioManager *tempManager = [[WWAudioManager alloc] init];
        [managers addObject:tempManager];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        WWAudioManager *tempManager = [[WWAudioManager alloc] init];
        [managers addObject:tempManager];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        WWAudioManager *tempManager = [[WWAudioManager alloc] init];
        [managers addObject:tempManager];
    });
    
    WWAudioManager *managerOne = [WWAudioManager defaultManager];
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [managers enumerateObjectsUsingBlock:^(WWAudioManager *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            XCTAssertEqual(managerOne, obj, @"ZYAudioManager is not single");
        }];
        
    });
}

/**
 *  测试是否可以正常播放音乐
 */
- (void)testPlayingMusic
{
    self.player = [[WWAudioManager defaultManager] playingMusic:_fileName];
    XCTAssertTrue(self.player.playing, @"WWAudioManager is not PlayingMusic");
}

/**
 *  测试是否可以正常停止音乐
 */
- (void)testStopMusic
{
    if (self.player == nil) {
        self.player = [[WWAudioManager defaultManager] playingMusic:_fileName];
    }
    
    if (self.player.playing == NO) [self.player play];
    
    [[WWAudioManager defaultManager] stopMusic:_fileName];
    XCTAssertFalse(self.player.playing, @"WWAudioManager is not StopMusic");
}

/**
 *  测试是否可以正常暂停音乐
 */
- (void)testPauseMusic
{
    if (self.player == nil) {
        self.player = [[WWAudioManager defaultManager] playingMusic:_fileName];
    }
    if (self.player.playing == NO) [self.player play];
    [[WWAudioManager defaultManager] pauseMusic:_fileName];
    XCTAssertFalse(self.player.playing, @"WWAudioManager is not pauseMusic");
}

@end
