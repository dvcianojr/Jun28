//
//  View.m
//  Jun28
//
//  Created by Dominick Ciano on 6/22/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		NSString *string = @"                           Song: Start Me Up               ";
		UIFont *font = [UIFont systemFontOfSize: 18];
		CGSize size = [string sizeWithFont: font];
		
        // set title label to far left so it's hidden until animation kicks in, in drawRect()
		CGRect f = CGRectMake(
							  -label.bounds.size.width-140,
							  self.bounds.origin.y,
							  size.width +150,
							  size.height
							  );
		
		label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = [UIColor yellowColor];
		label.font = font;
		label.text = string;
		[self addSubview: label];
		
		// set up textView to hold song lyrics
		CGRect f2 = CGRectMake(
							   self.bounds.origin.x,
							   self.bounds.origin.y + size.height,
							   self.bounds.size.width,
							   self.bounds.size.height - size.height - 30
							   );			
		
		textView = [[UITextView alloc] initWithFrame: f2];
		textView.backgroundColor = [UIColor whiteColor];
		textView.textColor = [UIColor blackColor];
		textView.font = [UIFont fontWithName: @"Courier-Bold" size: 12];
		textView.editable = NO;	//Don't pop up a keyboard.
		// 42 + 1 (line feed) = 43 chars per line
		textView.text =		
		@"Lyrics:                                   \n"
		@"                                          \n"
		@"-Guitar Intro-                            \n"//00:00
		@"If you start me up                        \n"//00:15
		@"If you start me up I'll never stop        \n"//00:18
		@"If you start me up                        \n"//00:24
		@"If you start me up I'll never stop        \n"//00:27
		
		@"I've been running hot                     \n"//00:30
		@"You got me ticking gonna blow my top      \n"//00:33
		@"If you start me up                        \n"//00:38
		@"If you start me up I'll never stop        \n"//00:41
		@"Never stop, never stop, never stop:       \n"//00:45
		
		@"You make a grown man cry                  \n"//00:48
		@"You make a grown man cry                  \n"//00:51
		@"You make a grown man cry                  \n"//00:55
		@"Spread out the oil, the gasoline          \n"//00:59
		@"I walk smooth ride in a mean,mean machine \n"//01:03
		@"Start it up                               \n"//01:11
		
		@"If you start it up                        \n"//01:14
		@"You gotta start it, give it all you got   \n"//01:16 
		@"All you got, all you got                  \n"//01:19
		@"I can't compete                           \n"//01:22 
		@"With the riders in the other heats        \n"//01:24
		@"If you rough it up                        \n"//01:28
		@"If you like it you can slide it up        \n"//01:32
		@"Slide it up, slide it up,  slide it up    \n"//01:36
		
		@"Don't make a grown man cry                \n"//01:39
		@"Don't make a grown man cry                \n"//01:42
		@"Don't make a grown man cry                \n"//01:47
		@"My eyes dilate, my lips go green          \n"//01:50
		@"My hands are greasy,                      \n"//01:54 
		@"she's a mean, mean machine                \n"//01:56
		@"Start it up                               \n"//02:01
		
		@"Start me up                               \n"//02:05
		@"Give it all you got                       \n"//02:08
		@"You got to never, never, never stop       \n"//02:12
		@"Slide it up, baby just slide it up        \n"//02:14
		@"Slide it up, slide it up,                 \n"//02:19
		@"Never, never, never                       \n"//02:20
		
		@"You make a grown man cry                  \n"//02:22
		@"You make a grown man cry                  \n"//02:26
		@"You make a grown man cry                  \n"//02:30
		@"Ride like the wind at double speed        \n"//02:34
		@"I'll take you places that you've never,   \n"//02:38 
		@"Never seen                                \n"//02:40
		
		@"Start it up                               \n"//02:48
		@"Love the day when we'll never stop,       \n"//02:51
		@"Never stop, never, never, never stop      \n"//02:55
		@"Tough me up                               \n"//02:57
		@"Never stop, never stop                    \n"//03:00
		
		@"You, you, you make a grown man cry        \n"//03:05
		@"You, you make a dead man come             \n"//03:11
		@"You, you make a dead man come             ";//03:20

		//create play button
		playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		playButton.backgroundColor = [UIColor redColor];
		
		//set the position of the button
		playButton.frame = CGRectMake(0, 430,160, 30);
		
		//set the button's title
		[playButton setTitle:@"Play Song" forState:UIControlStateNormal];
		
		//listen for clicks
		[playButton addTarget:self action:@selector(playPressed) 
			 forControlEvents:UIControlEventTouchUpInside];
		
		//create karaoke button
		karaokeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		karaokeButton.backgroundColor = [UIColor redColor];
		
		//set the position of karaoke button
		karaokeButton.frame = CGRectMake(160, 430,160, 30);
		
		//set the button's title
		[karaokeButton setTitle:@"Karaoke" forState:UIControlStateNormal];
		
		//listen for clicks
		[karaokeButton addTarget:self action:@selector(karaokePressed) 
				forControlEvents:UIControlEventTouchUpInside];
		
		//add buttons to view
		[self addSubview: textView];	
		[self addSubview:playButton];
		[self addSubview:karaokeButton];				
	}
	return self;
}
-(void)playPressed {
	
	if (playButton.titleLabel.text == @"Play Song" && 
		karaokeButton.titleLabel.text == @"Karaoke"){
		[playButton setTitle:@"Stop" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
	}
	else if (playButton.titleLabel.text == @"Stop" && 
			 karaokeButton.titleLabel.text == @"Karaoke"){
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
		[player stop];
		[playButton setTitle:@"Play Song" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
		return;
	}
	else if (playButton.titleLabel.text == @"Play Song" && 
			 karaokeButton.titleLabel.text == @"Stop"){
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
		[player stop];
		[playButton setTitle:@"Stop" forState:UIControlStateNormal];
		[karaokeButton setTitle:@"Karaoke" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
	}		
	NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"could not get the main bundle");
		return ;
	}
	
	//The path is the filename.
	NSString *path =
	[bundle pathForResource: @"StartMeUp" ofType: @"mp3"];
	if (path == nil) {
		NSLog(@"could not get the path");
		return ;
	}
	NSLog(@"path == \"%@\"", path);
	
	NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
	
	NSError *error = nil;
	player = [[AVAudioPlayer alloc]
			  initWithContentsOfURL: url error: &error];
	if (player == nil) {
		NSLog(@"error == %@", error);
		return ;
	}
	
	if (![player prepareToPlay]) {
		NSLog(@"could not prepare to play");
		return;
	}
	
	if (![player play]) {
		NSLog(@"could not play");
	}
	
	[self->textView select:self]; // needed for highlight to display
	int startTimes[] = {0, 15, 18, 24, 27, 30, 33, 38, 41, 45, 48, 51, 55, 59, 63, 71, 74, 76, 79, 82,
		84, 88, 92, 96, 99, 102, 107, 110, 114, 116, 121, 125, 128, 132, 134, 139, 140, 
		142, 146, 150, 154, 158, 160, 168, 171, 175, 177, 180, 185, 191, 200}; // in seconds
	for (int i=0; i<51; ++i){		
		[self performSelector:@selector(placeAtLocation:) withObject: [[NSNumber alloc] initWithInt:43*(i+2)] afterDelay:startTimes[i]]; // position at 43 chars per line * line # = 2
	}
	
}
-(void)karaokePressed {
	
	if (playButton.titleLabel.text == @"Play Song" && 
		karaokeButton.titleLabel.text == @"Karaoke"){		
		[karaokeButton setTitle:@"Stop" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
	}
	else if (playButton.titleLabel.text == @"Play Song" && 
			 karaokeButton.titleLabel.text == @"Stop"){
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
		[player stop];
		[karaokeButton setTitle:@"Karaoke" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
		return;
	}
	else if (playButton.titleLabel.text == @"Stop" && 
			 karaokeButton.titleLabel.text == @"Karaoke"){
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
		[player stop];
		[karaokeButton setTitle:@"Stop" forState:UIControlStateNormal];
		[playButton setTitle:@"Play Song" forState:UIControlStateNormal];
		textView.editable = NO;	//Don't pop up a keyboard.
	}
	
	NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"could not get the main bundle");
		return ;
	}
	
	//The path is the filename.
	NSString *path =
	[bundle pathForResource: @"StartMeUpWithoutVocals" ofType: @"mp3"];
	if (path == nil) {
		NSLog(@"could not get the path");
		return ;
	}
	NSLog(@"path == \"%@\"", path);
	
	NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
	
	NSError *error = nil;
	player = [[AVAudioPlayer alloc]
			  initWithContentsOfURL: url error: &error];
	if (player == nil) {
		NSLog(@"error == %@", error);
		return ;
	}
	
	if (![player prepareToPlay]) {
		NSLog(@"could not prepare to play");
		return;
	}
	
	if (![player play]) {
		NSLog(@"could not play");
	}
	
	[self->textView select:self]; // needed for highlight to display
	int startTimes[] = {0, 15, 18, 24, 27, 30, 33, 38, 41, 45, 48, 51, 55, 59, 63, 71, 74, 76, 79, 82,
		84, 88, 92, 96, 99, 102, 107, 110, 114, 116, 121, 125, 128, 132, 134, 139, 140, 
		142, 146, 150, 154, 158, 160, 168, 171, 175, 177, 180, 185, 191, 200}; // in seconds
	for (int i=0; i<51; ++i){		
		[self performSelector:@selector(placeAtLocation:) withObject: [[NSNumber alloc] initWithInt:43*(i+2)] afterDelay:startTimes[i]]; // position at 43 chars per line * line # = 2
	}
	
}

- (void) placeAtLocation: (NSNumber *) loc;
{
	NSRange selection;
	selection.location = loc.intValue; 
	selection.length = 42; // each line of this text view is fixed at 42 chars
	
	self->textView.selectedRange =  selection; // select text in text view
	[self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code - Slide title from left to right with animation
	self.backgroundColor = [UIColor yellowColor];
	[UIView animateWithDuration: 2
						  delay: 0
						options: UIViewAnimationOptionCurveLinear
					 animations: ^{
						 label.center = CGPointMake(
													self.bounds.origin.x + 200,
													self.bounds.origin.y + 10
													);
					 }
					 completion: NULL
	 ];
}


@end
