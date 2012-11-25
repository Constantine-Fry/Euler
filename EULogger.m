//
//  EUPrinter.m
//  GTest
//
//  Created by Constantine Fry on 11/24/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EULogger.h"



void EULog(NSString* format, ...){
    va_list argList;
    va_start(argList, format);
    NSString* formattedMessage = [[NSString alloc] initWithFormat: format arguments: argList];
    va_end(argList);
    EULogger *l = [EULogger sharedInstance];
    [l printString:formattedMessage];
}













@interface EUConsoleLogger : EULogger<Printer>

@end

@implementation EUConsoleLogger

-(void)printString:(NSString*)string{
    fputs([string UTF8String], stdout);
    fputs("\n", stdout);
}

@end







@implementation EULogger

static EULogger *_printer;
+(id)sharedInstance{
    if (!_printer) {
        _printer = [[EULogger alloc]init];
        _printer.mainLogger = [[EUConsoleLogger alloc]init];
    }
    return  _printer;
}

-(void)print:(id)format, ...{
    va_list argList;
    va_start(argList, format);
    NSString* formattedMessage = [[NSString alloc] initWithFormat: format arguments: argList];
    va_end(argList);
    [self printString:formattedMessage];
}

-(void)printString:(id)string{
    [self.mainLogger printString:string];
    [self.additionalLogger printString:string];
}


@end
