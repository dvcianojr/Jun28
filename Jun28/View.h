//
//  View.h
//  Jun28
//
//  Created by Dominick Ciano on 6/22/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer

@interface View: UIView {
	UILabel *label;
	UITextView *textView;
	AVAudioPlayer *player;
	UIButton *playButton;
	UIButton *karaokeButton;
}
- (void) playPressed;
- (void) karaokePressed;
- (void) placeAtLocation: (NSNumber *) loc;
@end
