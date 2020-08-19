//
//  AVPlayer.m
//  GamesScreensaver
//
//  Created by orta therox on 14/05/2013.
//  Copyright (c) 2013 Orta. All rights reserved.
//

#import "RMVideoView.h"

static void *RMVideoViewPlayerLayerReadyForDisplay = &RMVideoViewPlayerLayerReadyForDisplay;
static void *RMVideoViewPlayerItemStatusContext = &RMVideoViewPlayerItemStatusContext;

@interface RMVideoView()

- (void)onError:(NSError*)error;
- (void)onReadyToPlay;
- (void)setUpPlaybackOfAsset:(AVAsset *)asset withKeys:(NSArray *)keys;

@end

@implementation RMVideoView

- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.wantsLayer = YES;
    _player = [[AVPlayer alloc] init];
    [self addObserver:self forKeyPath:@"player.currentItem.status" options:NSKeyValueObservingOptionNew context:RMVideoViewPlayerItemStatusContext];
  }

  return self;
}

- (void) dealloc {
  NSLog(@"calling dealloc");
  [self stop_and_destroy];
}

- (void) setVideoPath:(NSString *)videoPath {
  NSURL *url = [NSURL fileURLWithPath:videoPath];
  [self setVideoURL:url];
}

- (void) setVideoURL:(NSURL *)videoURL {
  _videoURL = videoURL;

  [self.player pause];
  [self.playerLayer removeFromSuperlayer];

  AVAsset *asset = [AVAsset assetWithURL:_videoURL];
  [self setVideoAsset:asset];
}

- (void) setVideoAsset:(AVAsset *)asset {
  NSArray *assetKeysToLoadAndTest = [NSArray arrayWithObjects:@"playable", @"hasProtectedContent", @"tracks", @"duration", nil];
  [asset loadValuesAsynchronouslyForKeys:assetKeysToLoadAndTest completionHandler:^(void) {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
      [self setUpPlaybackOfAsset:asset withKeys:assetKeysToLoadAndTest];
    });
  }];
}

-(void)itemDidFinishPlaying:(NSNotification *) notification {
  // Will be called when AVPlayer finishes playing playerItem
  if (self.looping == true) {
    // NSLog(@"Restarting video.");
    [self restart];
  } else {
    if (self.afterPlay != nil) {
      NSLog(@"Calling block after play.");
      self.afterPlay();
      self.afterPlay = nil;
    } else {
      NSLog(@"Sending VideoEnded notification.");
      [[NSNotificationCenter defaultCenter] postNotificationName:@"VideoEnded" object:_videoURL];
    }
  }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (context == RMVideoViewPlayerItemStatusContext) {
    AVPlayerStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
    switch (status) {
      case AVPlayerItemStatusUnknown:
        break;
      case AVPlayerItemStatusReadyToPlay:
        [self onReadyToPlay];
        break;
      case AVPlayerItemStatusFailed:
        [self onError:nil];
        break;
    }
  } else if (context == RMVideoViewPlayerLayerReadyForDisplay) {
    if ([[change objectForKey:NSKeyValueChangeNewKey] boolValue]) {
      self.playerLayer.hidden = NO;
    }
  } else {
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
  }
}

#pragma mark - Private

- (void)onError:(NSError *)error { // Notify delegate
}

- (void)onReadyToPlay { // Notify delegate
  if([_delegate respondsToSelector:@selector(videoViewIsReadyToPlay)]) {
    [_delegate videoViewIsReadyToPlay];
  }
}

- (void)setUpPlaybackOfAsset:(AVAsset *)asset withKeys:(NSArray *)keys {
  for (NSString *key in keys) {
    NSError *error = nil;
    if ([asset statusOfValueForKey:key error:&error] == AVKeyValueStatusFailed) {
      [self onError:error];
      return;
    }
  }

  if (!asset.isPlayable || asset.hasProtectedContent) {
    [self onError:nil];
    return;
  }

  if ([[asset tracksWithMediaType:AVMediaTypeVideo] count] != 0) { // Asset has video tracks
    if(_playerLayer != nil) {
      @try{
        [self removeObserver:self forKeyPath:@"playerLayer.readyForDisplay"];
      }@catch(id anException){}
    }

    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.layer.bounds;
    self.playerLayer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
    self.playerLayer.hidden = YES;
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;

    [self.layer addSublayer:self.playerLayer];
    [self addObserver:self forKeyPath:@"playerLayer.readyForDisplay" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:RMVideoViewPlayerLayerReadyForDisplay];
  }

  // Create a new AVPlayerItem and make it our player's current item.
  AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];

  // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];

  [self.player replaceCurrentItemWithPlayerItem:playerItem];
}

#pragma mark - Public

- (void) play {
  NSLog(@"Called play");
  self.looping = false;
  [self.player play];
}

- (void) playThen:(void (^)(void))after {
  NSLog(@"Called playthen");

  if (self.playerLayer != nil) {
    self.afterPlay = after;
    [self play];
  } else {
    after();
  }
}

- (void) loopVideo {
  self.looping = true;
  [self reset];
  [self.player play];
}

- (void) stop {
	NSLog(@"Called stop");
  [self pause];
}

- (void) pause {
	NSLog(@"Called pause");
  [self.player pause];
}

- (void) stop_and_destroy {
	NSLog(@"Called stop_and_destroy");
  [self.player pause];
  @try{
    [self removeObserver:self forKeyPath:@"player.currentItem.status"];
  }@catch(id anException){}

  @try{
    [self removeObserver:self forKeyPath:@"playerLayer.readyForDisplay"];
  }@catch(id anException){}

  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) reset {
	NSLog(@"Called reset");
  [self.player seekToTime:kCMTimeZero];
}

- (void) restart {
  [self reset];
  [self.player play];
}

# pragma mark -
# pragma mark Audio Commands

- (void) mute {
  [self.player setMuted:true];
}

- (void) unmute {
  [self.player setMuted:false];
}

-(void) fadeVolumeOut {
  if(self.player.volume > 0.1) {
    self.player.volume -= 0.1;
    [self performSelector:@selector(fadeVolumeOut) withObject:nil afterDelay:0.1];
  }
}

-(void) fadeVolumeIn {
  if(self.player.volume < 1.0) {
    self.player.volume += 0.1;
    [self performSelector:@selector(fadeVolumeIn) withObject:nil afterDelay:0.1];
  }
}

@end
