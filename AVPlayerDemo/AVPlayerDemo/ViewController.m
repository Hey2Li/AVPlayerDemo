//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by Tebuy on 16/10/26.
//  Copyright © 2016年 LeeIn. All rights reserved.
//

#import "ViewController.h"
#import "LVieoView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) NSString *moviePath;//播放路径
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //AVPlayer播放
    LVieoView *videoView = [[LVieoView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height/3)];
    videoView.videoUrl = @"http://baobab.wdjcdn.com/1455782903700jy.mp4";
    [self.view addSubview:videoView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    videoView.backgroundColor = [UIColor whiteColor];
    
    //MP播放
    self.moviePath = @"http://baobab.wdjcdn.com/1455782903700jy.mp4";
}
- (void)setMoviePath:(NSString *)moviePath{
    _moviePath = [moviePath copy];

    self.moviePlayer.view.backgroundColor = [UIColor clearColor];
    // 设置播放的路径
    self.moviePlayer.contentURL = [NSURL URLWithString:moviePath];
    [self.moviePlayer prepareToPlay];
    
    [self.moviePlayer play];
}

-(MPMoviePlayerController *)moviePlayer{
    if (!_moviePlayer) {
        _moviePlayer = [[MPMoviePlayerController alloc]init];
        [_moviePlayer.view setFrame:CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height/3)];
        //设置自动播放
        [_moviePlayer setShouldAutoplay:NO];
        //设置源类型 因为新特性一般都是播放本地的小视频 所以设置源类型为file
        _moviePlayer.movieSourceType = MPMovieSourceTypeStreaming;

        [self.view addSubview:_moviePlayer.view];
    }
    return _moviePlayer;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
