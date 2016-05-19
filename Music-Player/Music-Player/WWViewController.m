//
//  WWViewController.m
//  Music-Player
//
//  Created by King on 16/3/10.
//  Copyright © 2016年 King. All rights reserved.
//

#import "WWViewController.h"
#import "WWPlayingViewController.h"
#import "WWMusicTool.h"
#import "WWMusic.h"
#import "WWMusicCell.h"
@interface WWViewController ()
@property (nonatomic, strong) WWPlayingViewController *playingVc;

@property (nonatomic, assign) int currentIndex;
@end

@implementation WWViewController
- (WWPlayingViewController *)playingVc
{
    if (_playingVc == nil) {
        _playingVc = [[WWPlayingViewController alloc] initWithNibName:@"WWPlayingViewController" bundle:nil];
    }
    return _playingVc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupNavigation];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)setupNavigation
{
    self.navigationItem.title = @"音乐播放器";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [WWMusicTool musics].count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WWMusicCell *cell = [WWMusicCell musicCellWithTableView:tableView];
    cell.music = [WWMusicTool musics][indexPath.row];
    
   
    
    
    
    return cell;
}

#pragma mark ----TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [WWMusicTool setPlayingMusic:[WWMusicTool musics][indexPath.row]];
    
    WWMusic *preMusic = [WWMusicTool musics][self.currentIndex];
    preMusic.playing = NO;
    WWMusic *music = [WWMusicTool musics][indexPath.row];
    music.playing = YES;
    NSArray *indexPaths = @[
                            [NSIndexPath indexPathForItem:self.currentIndex inSection:0],
                            indexPath
                            ];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
    self.currentIndex = (int)indexPath.row;
    
    [self.playingVc show];
}



@end
