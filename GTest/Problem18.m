//
//  Problem18.m
//  GTest
//
//  Created by Constantine Fry on 12/1/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem18.h"

@implementation Problem18{
    NSArray *_input;
}


-(NSString*)getFilename{
    return @"input18";
}

-(NSArray*)getInputNumbers{
    NSString *path = [[NSBundle mainBundle] pathForResource:[self getFilename]
                                                     ofType:@"txt"];
    NSString *input = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    NSArray *a = [input componentsSeparatedByString:@"\n"];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:a.count];
    for (NSString *str in a) {
        NSMutableArray *line = [[str componentsSeparatedByString:@" "] mutableCopy];
        [line insertObject:@(0) atIndex:0];
        [line addObject:@(0)];
        [result addObject:line];
    }
    return result;
}

- (id)init
{
    self = [super init];
    if (self) {
        _input = [self getInputNumbers];
        
    }
    return self;
}


-(void)solve{

    NSMutableArray *prev = _input[0];
    NSMutableArray *cur = [NSMutableArray arrayWithCapacity:prev.count+1];
    [cur addObject:@(0)];
    for (int i = 1; i <_input.count; i++) {
        NSArray *line = _input[i];
        for (int j = 1 ; j< line.count-1; j++) {
            NSNumber *l = prev[j-1];
            NSNumber *r = prev[j];
            int choose = MAX(l.intValue, r.intValue);
            [cur addObject:@([line[j] intValue]+choose)];
        }
        [cur addObject:@(0)];
        prev = cur;
        cur = [NSMutableArray arrayWithCapacity:prev.count+1];
        [cur addObject:@(0)];
    }
    int max = 0;
    for (NSNumber *n in prev) {
        max = MAX(n.intValue, max);
    }
    EULog(@"Answer: %d",max);
}


@end
