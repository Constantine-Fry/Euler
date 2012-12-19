//
//  EUPrinter.h
//  GTest
//
//  Created by Constantine Fry on 11/24/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//



@protocol Printer <NSObject>
-(void)printString:(NSString*)string;
@end

void EULog(NSString* format, ...);









@interface EULogger : NSObject


@property(nonatomic,strong)id<Printer> mainLogger;
@property(nonatomic,strong)id<Printer> additionalLogger;


+(id)sharedInstance;
-(void)print:(id)format, ... ;
-(void)printString:(id)string;
@end
