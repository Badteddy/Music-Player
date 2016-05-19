//
//  WWLrcView.h
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWLrcView : UIImageView
@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, copy) NSString *fileName;
@end
