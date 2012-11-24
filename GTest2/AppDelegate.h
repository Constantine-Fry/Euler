//
//  AppDelegate.h
//  GTest2
//
//  Created by Constantine Fry on 11/24/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (assign) IBOutlet NSWindow *window;

- (IBAction)solve:(id)sender;

@end
