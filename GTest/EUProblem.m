//
//  EUProblem.m
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

@implementation EUProblem

-(NSString*)openFileWithName:(NSString*)string{
    NSArray *a = [string componentsSeparatedByString:@"."];
    NSString *path = [[NSBundle mainBundle] pathForResource:a[0]
                                                     ofType:a[1]];
    NSString *input = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    return input;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)check{
    if ([self isKindOfClass:[EUProblem class]]) {
        [NSException raise:@"Abstract Class" format:@"" ];
    }
}

-(void)solve{
    [self check];
}

-(NSNumber*)solveFor:(int)num{
    [self check];
    return @(-1);
}

-(NSNumber*)solveForLong:(long)num{
    [self check];
    return @(-1);
}



@end
