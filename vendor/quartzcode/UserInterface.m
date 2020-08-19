//
//  UserInterface.m
//
//  Code generated using QuartzCode 1.66.4 on 2020-08-18.
//  www.quartzcodeapp.com
//

#import "UserInterface.h"
#import "QCMethod.h"

@interface UserInterface ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation UserInterface

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}



- (void)setupProperties{
	self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
	self.layers = [NSMutableDictionary dictionary];
	
}

- (void)setupLayers{
	[self setWantsLayer:YES];
	
	self.layer.backgroundColor = [NSColor colorWithRed:0.958 green: 1 blue:0.948 alpha:0].CGColor;
	
	CALayer * CreeSyllabic_introbackground = [CALayer layer];
	CreeSyllabic_introbackground.frame    = CGRectMake(-89, 0, 5334, 3000);
	CreeSyllabic_introbackground.opacity  = 0;
	CreeSyllabic_introbackground.contents = [NSImage imageNamed:@"CreeSyllabic_intro-background"];
	[self.layer addSublayer:CreeSyllabic_introbackground];
	self.layers[@"CreeSyllabic_introbackground"] = CreeSyllabic_introbackground;
	
	CAShapeLayer * rectangle = [CAShapeLayer layer];
	rectangle.frame       = CGRectMake(0.5, 0.5, 3840, 2160);
	rectangle.opacity     = 0;
	rectangle.fillColor   = [NSColor redColor].CGColor;
	rectangle.strokeColor = [NSColor colorWithRed:0.404 green: 0.404 blue:0.404 alpha:1].CGColor;
	rectangle.path        = [self rectanglePath].quartzPath;
	[self.layer addSublayer:rectangle];
	self.layers[@"rectangle"] = rectangle;
	
	CATextLayer * TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE = [CATextLayer layer];
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.frame = CGRectMake(486.69, 1192.42, 2866.62, 328.11);
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.opacity = 0;
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.contentsScale = [[NSScreen mainScreen] backingScaleFactor];
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.string = @"TEESTING TILE FOR WANUSKEWIN PROJECT. \nHERE WE WILL INSERT OUR TITLE.";
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.font = (__bridge CFTypeRef)@"GothamNarrow-Book";
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.fontSize = 130;
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.alignmentMode = kCAAlignmentCenter;
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE.foregroundColor = [NSColor colorWithRed:0.948 green: 0.999 blue:0.771 alpha:1].CGColor;
	[self.layer addSublayer:TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE];
	self.layers[@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE"] = TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE;
	
	CATextLayer * descrip = [CATextLayer layer];
	descrip.frame           = CGRectMake(885.5, 978.29, 2107.96, 204.42);
	descrip.opacity         = 0;
	descrip.contentsScale   = [[NSScreen mainScreen] backingScaleFactor];
	descrip.string          = @"This is a paragraph where decription of the interface goes. \nThis is a test";
	descrip.font            = (__bridge CFTypeRef)@"GothamNarrow-Light";
	descrip.fontSize        = 80;
	descrip.alignmentMode   = kCAAlignmentCenter;
	descrip.foregroundColor = [NSColor colorWithRed:0.902 green: 0.895 blue:0.701 alpha:1].CGColor;
	[self.layer addSublayer:descrip];
	self.layers[@"descrip"] = descrip;
	
	CALayer * touch_to_start = [CALayer layer];
	touch_to_start.frame    = CGRectMake(1499.13, 702.03, 880.7, 260.45);
	touch_to_start.opacity  = 0;
	touch_to_start.contents = [NSImage imageNamed:@"touch_to_start"];
	[self.layer addSublayer:touch_to_start];
	self.layers[@"touch_to_start"] = touch_to_start;
	
	CALayer * Bison_1_001_43 = [CALayer layer];
	Bison_1_001_43.frame    = CGRectMake(165, 1000, 1533.97, 968.74);
	Bison_1_001_43.opacity  = 0;
	Bison_1_001_43.contents = [NSImage imageNamed:@"Bison_1_001_43.jpg"];
	[self.layer addSublayer:Bison_1_001_43];
	self.layers[@"Bison_1_001_43"] = Bison_1_001_43;
	
	CALayer * highlightedvideobackground = [CALayer layer];
	highlightedvideobackground.frame    = CGRectMake(87.91, 238, 803.39, 594.26);
	highlightedvideobackground.opacity  = 0;
	highlightedvideobackground.contents = [NSImage imageNamed:@"highlightedvideo-background"];
	[self.layer addSublayer:highlightedvideobackground];
	self.layers[@"highlightedvideobackground"] = highlightedvideobackground;
	
	CALayer * Bison_1_001_ = [CALayer layer];
	Bison_1_001_.frame    = CGRectMake(165, 379.5, 649.22, 410);
	Bison_1_001_.opacity  = 0;
	Bison_1_001_.contents = [NSImage imageNamed:@"Bison_1_001_43.jpg"];
	[self.layer addSublayer:Bison_1_001_];
	self.layers[@"Bison_1_001_"] = Bison_1_001_;
	
	CATextLayer * videosub = [CATextLayer layer];
	videosub.frame           = CGRectMake(165.5, 238.5, 524.34, 94.31);
	videosub.opacity         = 0;
	videosub.contentsScale   = [[NSScreen mainScreen] backingScaleFactor];
	videosub.string          = @"Celebrations";
	videosub.font            = (__bridge CFTypeRef)@"GothamNarrow-Light";
	videosub.fontSize        = 56;
	videosub.alignmentMode   = kCAAlignmentLeft;
	videosub.foregroundColor = [NSColor blackColor].CGColor;
	[self.layer addSublayer:videosub];
	self.layers[@"videosub"] = videosub;
	
	CATextLayer * VideoTitleNext = [CATextLayer layer];
	VideoTitleNext.frame           = CGRectMake(1878.41, 1613.5, 1002.84, 139.72);
	VideoTitleNext.opacity         = 0;
	VideoTitleNext.contentsScale   = [[NSScreen mainScreen] backingScaleFactor];
	VideoTitleNext.string          = @"VIdeo Title on About";
	VideoTitleNext.font            = (__bridge CFTypeRef)@"GothamNarrow-Light";
	VideoTitleNext.fontSize        = 90;
	VideoTitleNext.alignmentMode   = kCAAlignmentCenter;
	VideoTitleNext.foregroundColor = [NSColor colorWithRed:0.778 green: 0.728 blue:0.673 alpha:1].CGColor;
	[self.layer addSublayer:VideoTitleNext];
	self.layers[@"VideoTitleNext"] = VideoTitleNext;
	
	CATextLayer * text = [CATextLayer layer];
	text.frame           = CGRectMake(1983.6, 1096.5, 1188.81, 432.95);
	text.opacity         = 0;
	text.contentsScale   = [[NSScreen mainScreen] backingScaleFactor];
	text.string          = @"This is a video description next to the video \n";
	text.font            = (__bridge CFTypeRef)@"GothamNarrow-Light";
	text.fontSize        = 42;
	text.alignmentMode   = kCAAlignmentLeft;
	text.foregroundColor = [NSColor colorWithRed:0.774 green: 0.728 blue:0.673 alpha:1].CGColor;
	[self.layer addSublayer:text];
	self.layers[@"text"] = text;
	
	CALayer * backbutton = [CALayer layer];
	backbutton.frame    = CGRectMake(165, 185, 563.11, 115.68);
	backbutton.opacity  = 0;
	backbutton.contents = [NSImage imageNamed:@"back-button"];
	[self.layer addSublayer:backbutton];
	self.layers[@"backbutton"] = backbutton;
	
	CALayer * playercontrols_progressionbarbg = [CALayer layer];
	playercontrols_progressionbarbg.frame = CGRectMake(1171.1, 238, 1624, 14);
	playercontrols_progressionbarbg.opacity = 0;
	playercontrols_progressionbarbg.contents = [NSImage imageNamed:@"playercontrols_progressionbar-bg"];
	[self.layer addSublayer:playercontrols_progressionbarbg];
	self.layers[@"playercontrols_progressionbarbg"] = playercontrols_progressionbarbg;
	
	CALayer * playercontrols_progressionbar = [CALayer layer];
	playercontrols_progressionbar.frame    = CGRectMake(1171.1, 238, 880.12, 14);
	playercontrols_progressionbar.opacity  = 0;
	playercontrols_progressionbar.contents = [NSImage imageNamed:@"playercontrols_progressionbar"];
	[self.layer addSublayer:playercontrols_progressionbar];
	self.layers[@"playercontrols_progressionbar"] = playercontrols_progressionbar;
	
	CALayer * playercontrolsprogessindicator = [CALayer layer];
	playercontrolsprogessindicator.frame   = CGRectMake(2051.22, 224, 44, 44);
	playercontrolsprogessindicator.opacity = 0;
	playercontrolsprogessindicator.contents = [NSImage imageNamed:@"playercontrols-progessindicator"];
	[self.layer addSublayer:playercontrolsprogessindicator];
	self.layers[@"playercontrolsprogessindicator"] = playercontrolsprogessindicator;
	
	CALayer * playercontrols_pausebutton = [CALayer layer];
	playercontrols_pausebutton.frame    = CGRectMake(879, 226, 32, 38);
	playercontrols_pausebutton.opacity  = 0;
	playercontrols_pausebutton.contents = [NSImage imageNamed:@"playercontrols_pause-button"];
	[self.layer addSublayer:playercontrols_pausebutton];
	self.layers[@"playercontrols_pausebutton"] = playercontrols_pausebutton;
}



#pragma mark - Animation Setup

- (void)addOpeningAnimation{
	[self addOpeningAnimationCompletionBlock:nil];
}

- (void)addOpeningAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addOpeningAnimationReverse:NO totalDuration:2.994 completionBlock:completionBlock];
}

- (void)addOpeningAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = totalDuration;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Opening" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Opening"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Opening"]];
	}
	
	NSString * fillMode = reverseAnimation ??kCAFillModeBoth : kCAFillModeForwards;
	
	////CreeSyllabic_introbackground animation
	CAKeyframeAnimation * CreeSyllabic_introbackgroundOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	CreeSyllabic_introbackgroundOpacityAnim.values = @[@0, @1];
	CreeSyllabic_introbackgroundOpacityAnim.keyTimes = @[@0, @1];
	CreeSyllabic_introbackgroundOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * CreeSyllabic_introbackgroundOpeningAnim = [QCMethod groupAnimations:@[CreeSyllabic_introbackgroundOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) CreeSyllabic_introbackgroundOpeningAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:CreeSyllabic_introbackgroundOpeningAnim totalDuration:totalDuration];
	[self.layers[@"CreeSyllabic_introbackground"] addAnimation:CreeSyllabic_introbackgroundOpeningAnim forKey:@"CreeSyllabic_introbackgroundOpeningAnim"];
	
	////Rectangle animation
	CAKeyframeAnimation * rectangleOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	rectangleOpacityAnim.values   = @[@0, @0.21];
	rectangleOpacityAnim.keyTimes = @[@0, @1];
	rectangleOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * rectangleOpeningAnim = [QCMethod groupAnimations:@[rectangleOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) rectangleOpeningAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:rectangleOpeningAnim totalDuration:totalDuration];
	[self.layers[@"rectangle"] addAnimation:rectangleOpeningAnim forKey:@"rectangleOpeningAnim"];
	
	////TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE animation
	CAKeyframeAnimation * TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpacityAnim.values = @[@0, @1];
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpacityAnim.keyTimes = @[@0, @1];
	TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpacityAnim.duration = totalDuration;
	
	CAAnimationGroup * TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim = [QCMethod groupAnimations:@[TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim totalDuration:totalDuration];
	[self.layers[@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE"] addAnimation:TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim forKey:@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim"];
	
	////Descrip animation
	CAKeyframeAnimation * descripOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	descripOpacityAnim.values   = @[@0, @1];
	descripOpacityAnim.keyTimes = @[@0, @1];
	descripOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * descripOpeningAnim = [QCMethod groupAnimations:@[descripOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) descripOpeningAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:descripOpeningAnim totalDuration:totalDuration];
	[self.layers[@"descrip"] addAnimation:descripOpeningAnim forKey:@"descripOpeningAnim"];
	
	////Touch_to_start animation
	CAKeyframeAnimation * touch_to_startOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	touch_to_startOpacityAnim.values   = @[@0, @1];
	touch_to_startOpacityAnim.keyTimes = @[@0, @1];
	touch_to_startOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * touch_to_startOpeningAnim = [QCMethod groupAnimations:@[touch_to_startOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) touch_to_startOpeningAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:touch_to_startOpeningAnim totalDuration:totalDuration];
	[self.layers[@"touch_to_start"] addAnimation:touch_to_startOpeningAnim forKey:@"touch_to_startOpeningAnim"];
}

- (void)addVideoBackgroundAnimation{
	[self addVideoBackgroundAnimationCompletionBlock:nil];
}

- (void)addVideoBackgroundAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addVideoBackgroundAnimationReverse:NO totalDuration:2.988 completionBlock:completionBlock];
}

- (void)addVideoBackgroundAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = totalDuration;
		completionAnim.delegate = self;
		[completionAnim setValue:@"VideoBackground" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"VideoBackground"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"VideoBackground"]];
	}
	
	NSString * fillMode = reverseAnimation ?kCAFillModeBoth : kCAFillModeForwards;
	
	////CreeSyllabic_introbackground animation
	CAKeyframeAnimation * CreeSyllabic_introbackgroundOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	CreeSyllabic_introbackgroundOpacityAnim.values = @[@0, @1];
	CreeSyllabic_introbackgroundOpacityAnim.keyTimes = @[@0, @1];
	CreeSyllabic_introbackgroundOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * CreeSyllabic_introbackgroundVideoBackgroundAnim = [QCMethod groupAnimations:@[CreeSyllabic_introbackgroundOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) CreeSyllabic_introbackgroundVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:CreeSyllabic_introbackgroundVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"CreeSyllabic_introbackground"] addAnimation:CreeSyllabic_introbackgroundVideoBackgroundAnim forKey:@"CreeSyllabic_introbackgroundVideoBackgroundAnim"];
	
	////Rectangle animation
	CAKeyframeAnimation * rectangleOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	rectangleOpacityAnim.values   = @[@0, @0.21];
	rectangleOpacityAnim.keyTimes = @[@0, @1];
	rectangleOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * rectangleVideoBackgroundAnim = [QCMethod groupAnimations:@[rectangleOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) rectangleVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:rectangleVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"rectangle"] addAnimation:rectangleVideoBackgroundAnim forKey:@"rectangleVideoBackgroundAnim"];
	
	////Bison_1_001_43 animation
	CAKeyframeAnimation * Bison_1_001_43OpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	Bison_1_001_43OpacityAnim.values   = @[@0, @1];
	Bison_1_001_43OpacityAnim.keyTimes = @[@0, @1];
	Bison_1_001_43OpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * Bison_1_001_43VideoBackgroundAnim = [QCMethod groupAnimations:@[Bison_1_001_43OpacityAnim] fillMode:fillMode];
	if (reverseAnimation) Bison_1_001_43VideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:Bison_1_001_43VideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"Bison_1_001_43"] addAnimation:Bison_1_001_43VideoBackgroundAnim forKey:@"Bison_1_001_43VideoBackgroundAnim"];
	
	////Highlightedvideobackground animation
	CAKeyframeAnimation * highlightedvideobackgroundOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	highlightedvideobackgroundOpacityAnim.values = @[@0, @1];
	highlightedvideobackgroundOpacityAnim.keyTimes = @[@0, @1];
	highlightedvideobackgroundOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * highlightedvideobackgroundVideoBackgroundAnim = [QCMethod groupAnimations:@[highlightedvideobackgroundOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) highlightedvideobackgroundVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:highlightedvideobackgroundVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"highlightedvideobackground"] addAnimation:highlightedvideobackgroundVideoBackgroundAnim forKey:@"highlightedvideobackgroundVideoBackgroundAnim"];
	
	////Bison_1_001_ animation
	CAKeyframeAnimation * Bison_1_001_OpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	Bison_1_001_OpacityAnim.values   = @[@0, @1];
	Bison_1_001_OpacityAnim.keyTimes = @[@0, @1];
	Bison_1_001_OpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * Bison_1_001_VideoBackgroundAnim = [QCMethod groupAnimations:@[Bison_1_001_OpacityAnim] fillMode:fillMode];
	if (reverseAnimation) Bison_1_001_VideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:Bison_1_001_VideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"Bison_1_001_"] addAnimation:Bison_1_001_VideoBackgroundAnim forKey:@"Bison_1_001_VideoBackgroundAnim"];
	
	////Videosub animation
	CAKeyframeAnimation * videosubOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	videosubOpacityAnim.values   = @[@0, @1];
	videosubOpacityAnim.keyTimes = @[@0, @1];
	videosubOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * videosubVideoBackgroundAnim = [QCMethod groupAnimations:@[videosubOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) videosubVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:videosubVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"videosub"] addAnimation:videosubVideoBackgroundAnim forKey:@"videosubVideoBackgroundAnim"];
	
	////VideoTitleNext animation
	CAKeyframeAnimation * VideoTitleNextOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	VideoTitleNextOpacityAnim.values   = @[@0, @1];
	VideoTitleNextOpacityAnim.keyTimes = @[@0, @1];
	VideoTitleNextOpacityAnim.duration = 1 * totalDuration;
	
	CAAnimationGroup * VideoTitleNextVideoBackgroundAnim = [QCMethod groupAnimations:@[VideoTitleNextOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) VideoTitleNextVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:VideoTitleNextVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"VideoTitleNext"] addAnimation:VideoTitleNextVideoBackgroundAnim forKey:@"VideoTitleNextVideoBackgroundAnim"];
	
	////Text animation
	CAKeyframeAnimation * textOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	textOpacityAnim.values                = @[@0, @1];
	textOpacityAnim.keyTimes              = @[@0, @1];
	textOpacityAnim.duration              = 1 * totalDuration;
	
	CAAnimationGroup * textVideoBackgroundAnim = [QCMethod groupAnimations:@[textOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) textVideoBackgroundAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:textVideoBackgroundAnim totalDuration:totalDuration];
	[self.layers[@"text"] addAnimation:textVideoBackgroundAnim forKey:@"textVideoBackgroundAnim"];
}

- (void)addVideoPlayerAnimation{
	[self addVideoPlayerAnimationCompletionBlock:nil];
}

- (void)addVideoPlayerAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addVideoPlayerAnimationReverse:NO totalDuration:2.999 completionBlock:completionBlock];
}

- (void)addVideoPlayerAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = totalDuration;
		completionAnim.delegate = self;
		[completionAnim setValue:@"VideoPlayer" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"VideoPlayer"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"VideoPlayer"]];
	}
	
	NSString * fillMode = reverseAnimation ?kCAFillModeBoth : kCAFillModeForwards;
	
	////Backbutton animation
	CAKeyframeAnimation * backbuttonOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	backbuttonOpacityAnim.values   = @[@0, @1];
	backbuttonOpacityAnim.keyTimes = @[@0, @1];
	backbuttonOpacityAnim.duration = 0.999 * totalDuration;
	
	CAAnimationGroup * backbuttonVideoPlayerAnim = [QCMethod groupAnimations:@[backbuttonOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) backbuttonVideoPlayerAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:backbuttonVideoPlayerAnim totalDuration:totalDuration];
	[self.layers[@"backbutton"] addAnimation:backbuttonVideoPlayerAnim forKey:@"backbuttonVideoPlayerAnim"];
	
	////Playercontrols_progressionbarbg animation
	CAKeyframeAnimation * playercontrols_progressionbarbgOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	playercontrols_progressionbarbgOpacityAnim.values = @[@0, @1];
	playercontrols_progressionbarbgOpacityAnim.keyTimes = @[@0, @1];
	playercontrols_progressionbarbgOpacityAnim.duration = totalDuration;
	
	CAAnimationGroup * playercontrols_progressionbarbgVideoPlayerAnim = [QCMethod groupAnimations:@[playercontrols_progressionbarbgOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) playercontrols_progressionbarbgVideoPlayerAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:playercontrols_progressionbarbgVideoPlayerAnim totalDuration:totalDuration];
	[self.layers[@"playercontrols_progressionbarbg"] addAnimation:playercontrols_progressionbarbgVideoPlayerAnim forKey:@"playercontrols_progressionbarbgVideoPlayerAnim"];
	
	////Playercontrols_progressionbar animation
	CAKeyframeAnimation * playercontrols_progressionbarOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	playercontrols_progressionbarOpacityAnim.values = @[@0, @1];
	playercontrols_progressionbarOpacityAnim.keyTimes = @[@0, @1];
	playercontrols_progressionbarOpacityAnim.duration = 0.999 * totalDuration;
	
	CAAnimationGroup * playercontrols_progressionbarVideoPlayerAnim = [QCMethod groupAnimations:@[playercontrols_progressionbarOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) playercontrols_progressionbarVideoPlayerAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:playercontrols_progressionbarVideoPlayerAnim totalDuration:totalDuration];
	[self.layers[@"playercontrols_progressionbar"] addAnimation:playercontrols_progressionbarVideoPlayerAnim forKey:@"playercontrols_progressionbarVideoPlayerAnim"];
	
	////Playercontrolsprogessindicator animation
	CAKeyframeAnimation * playercontrolsprogessindicatorOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	playercontrolsprogessindicatorOpacityAnim.values = @[@0, @1];
	playercontrolsprogessindicatorOpacityAnim.keyTimes = @[@0, @1];
	playercontrolsprogessindicatorOpacityAnim.duration = totalDuration;
	
	CAAnimationGroup * playercontrolsprogessindicatorVideoPlayerAnim = [QCMethod groupAnimations:@[playercontrolsprogessindicatorOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) playercontrolsprogessindicatorVideoPlayerAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:playercontrolsprogessindicatorVideoPlayerAnim totalDuration:totalDuration];
	[self.layers[@"playercontrolsprogessindicator"] addAnimation:playercontrolsprogessindicatorVideoPlayerAnim forKey:@"playercontrolsprogessindicatorVideoPlayerAnim"];
	
	////Playercontrols_pausebutton animation
	CAKeyframeAnimation * playercontrols_pausebuttonOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	playercontrols_pausebuttonOpacityAnim.values = @[@0, @1];
	playercontrols_pausebuttonOpacityAnim.keyTimes = @[@0, @1];
	playercontrols_pausebuttonOpacityAnim.duration = 0.999 * totalDuration;
	
	CAAnimationGroup * playercontrols_pausebuttonVideoPlayerAnim = [QCMethod groupAnimations:@[playercontrols_pausebuttonOpacityAnim] fillMode:fillMode];
	if (reverseAnimation) playercontrols_pausebuttonVideoPlayerAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:playercontrols_pausebuttonVideoPlayerAnim totalDuration:totalDuration];
	[self.layers[@"playercontrols_pausebutton"] addAnimation:playercontrols_pausebuttonVideoPlayerAnim forKey:@"playercontrols_pausebuttonVideoPlayerAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
	if (completionBlock){
		[self.completionBlocks removeObjectForKey:anim];
		if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
			[self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
			[self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
		}
		completionBlock(flag);
	}
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Opening"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"CreeSyllabic_introbackground"] animationForKey:@"CreeSyllabic_introbackgroundOpeningAnim"] theLayer:self.layers[@"CreeSyllabic_introbackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle"] animationForKey:@"rectangleOpeningAnim"] theLayer:self.layers[@"rectangle"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE"] animationForKey:@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim"] theLayer:self.layers[@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"descrip"] animationForKey:@"descripOpeningAnim"] theLayer:self.layers[@"descrip"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"touch_to_start"] animationForKey:@"touch_to_startOpeningAnim"] theLayer:self.layers[@"touch_to_start"]];
	}
	else if([identifier isEqualToString:@"VideoBackground"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"CreeSyllabic_introbackground"] animationForKey:@"CreeSyllabic_introbackgroundVideoBackgroundAnim"] theLayer:self.layers[@"CreeSyllabic_introbackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle"] animationForKey:@"rectangleVideoBackgroundAnim"] theLayer:self.layers[@"rectangle"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Bison_1_001_43"] animationForKey:@"Bison_1_001_43VideoBackgroundAnim"] theLayer:self.layers[@"Bison_1_001_43"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"highlightedvideobackground"] animationForKey:@"highlightedvideobackgroundVideoBackgroundAnim"] theLayer:self.layers[@"highlightedvideobackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Bison_1_001_"] animationForKey:@"Bison_1_001_VideoBackgroundAnim"] theLayer:self.layers[@"Bison_1_001_"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"videosub"] animationForKey:@"videosubVideoBackgroundAnim"] theLayer:self.layers[@"videosub"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"VideoTitleNext"] animationForKey:@"VideoTitleNextVideoBackgroundAnim"] theLayer:self.layers[@"VideoTitleNext"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text"] animationForKey:@"textVideoBackgroundAnim"] theLayer:self.layers[@"text"]];
	}
	else if([identifier isEqualToString:@"VideoPlayer"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"backbutton"] animationForKey:@"backbuttonVideoPlayerAnim"] theLayer:self.layers[@"backbutton"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"playercontrols_progressionbarbg"] animationForKey:@"playercontrols_progressionbarbgVideoPlayerAnim"] theLayer:self.layers[@"playercontrols_progressionbarbg"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"playercontrols_progressionbar"] animationForKey:@"playercontrols_progressionbarVideoPlayerAnim"] theLayer:self.layers[@"playercontrols_progressionbar"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"playercontrolsprogessindicator"] animationForKey:@"playercontrolsprogessindicatorVideoPlayerAnim"] theLayer:self.layers[@"playercontrolsprogessindicator"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"playercontrols_pausebutton"] animationForKey:@"playercontrols_pausebuttonVideoPlayerAnim"] theLayer:self.layers[@"playercontrols_pausebutton"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Opening"]){
		[self.layers[@"CreeSyllabic_introbackground"] removeAnimationForKey:@"CreeSyllabic_introbackgroundOpeningAnim"];
		[self.layers[@"rectangle"] removeAnimationForKey:@"rectangleOpeningAnim"];
		[self.layers[@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLE"] removeAnimationForKey:@"TESTINGTITLEFORWANUSKEWINPROJECTHEREWEWILLINCLUDETHEDESIREDTITLEOpeningAnim"];
		[self.layers[@"descrip"] removeAnimationForKey:@"descripOpeningAnim"];
		[self.layers[@"touch_to_start"] removeAnimationForKey:@"touch_to_startOpeningAnim"];
	}
	else if([identifier isEqualToString:@"VideoBackground"]){
		[self.layers[@"CreeSyllabic_introbackground"] removeAnimationForKey:@"CreeSyllabic_introbackgroundVideoBackgroundAnim"];
		[self.layers[@"rectangle"] removeAnimationForKey:@"rectangleVideoBackgroundAnim"];
		[self.layers[@"Bison_1_001_43"] removeAnimationForKey:@"Bison_1_001_43VideoBackgroundAnim"];
		[self.layers[@"highlightedvideobackground"] removeAnimationForKey:@"highlightedvideobackgroundVideoBackgroundAnim"];
		[self.layers[@"Bison_1_001_"] removeAnimationForKey:@"Bison_1_001_VideoBackgroundAnim"];
		[self.layers[@"videosub"] removeAnimationForKey:@"videosubVideoBackgroundAnim"];
		[self.layers[@"VideoTitleNext"] removeAnimationForKey:@"VideoTitleNextVideoBackgroundAnim"];
		[self.layers[@"text"] removeAnimationForKey:@"textVideoBackgroundAnim"];
	}
	else if([identifier isEqualToString:@"VideoPlayer"]){
		[self.layers[@"backbutton"] removeAnimationForKey:@"backbuttonVideoPlayerAnim"];
		[self.layers[@"playercontrols_progressionbarbg"] removeAnimationForKey:@"playercontrols_progressionbarbgVideoPlayerAnim"];
		[self.layers[@"playercontrols_progressionbar"] removeAnimationForKey:@"playercontrols_progressionbarVideoPlayerAnim"];
		[self.layers[@"playercontrolsprogessindicator"] removeAnimationForKey:@"playercontrolsprogessindicatorVideoPlayerAnim"];
		[self.layers[@"playercontrols_pausebutton"] removeAnimationForKey:@"playercontrols_pausebuttonVideoPlayerAnim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (NSBezierPath*)rectanglePath{
	NSBezierPath * rectanglePath = [NSBezierPath bezierPathWithRect:CGRectMake(0, 0, 3840, 2160)];
	return rectanglePath;
}


@end
