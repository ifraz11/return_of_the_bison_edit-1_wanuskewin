//
//  UserInterface.h
//
//  Code generated using QuartzCode 1.66.4 on 2020-08-18.
//  www.quartzcodeapp.com
//

#import <Cocoa/Cocoa.h>


@interface UserInterface : NSView



- (void)addOpeningAnimation;
- (void)addOpeningAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addOpeningAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addVideoBackgroundAnimation;
- (void)addVideoBackgroundAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addVideoBackgroundAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addVideoPlayerAnimation;
- (void)addVideoPlayerAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addVideoPlayerAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
