//
//  AppDelegate.m
//  GTest2
//
//  Created by Constantine Fry on 11/24/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "AppDelegate.h"
#import "EULogger.h"
#import "EUSDK.h"


@interface EUNSViewLogger : NSObject <Printer>

@property(nonatomic,unsafe_unretained)NSTextView *textView;
@end


@implementation EUNSViewLogger

-(void)printString:(NSString *)string{
    [self.textView insertText:string];
    [self.textView insertText:@"\n"];
}
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    EUNSViewLogger *l = [[EUNSViewLogger alloc]init];
    l.textView = self.textView;
    [[EULogger sharedInstance] setAdditionalLogger:l];
}

-(void)solve{
    EUProblem *p = [[Problem10 alloc]init];
    [p solve];
}

- (IBAction)solve:(NSButton*)sender {
    [self performSelector:@selector(solve)
                 onThread:[NSThread mainThread]
               withObject:nil
            waitUntilDone:NO];
}
@end
