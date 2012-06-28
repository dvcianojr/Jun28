//
//  Jun28AppDelegate.h
//  Jun28
//
//  Created by Dominick Ciano on 6/22/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Jun28AppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end