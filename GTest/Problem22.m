//
//  Problem22.m
//  GTest
//
//  Created by Constantine Fry on 12/3/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem22.h"

@implementation Problem22

-(NSArray*)getNames{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"names"
                                                     ofType:@"txt"];
    NSString *input = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    NSArray *a = [input componentsSeparatedByString:@"\""];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:a.count];
    for (NSString *str in a) {
        if (str.length >1) {
            [result addObject:str.lowercaseString];
        }
    }
    return result;
}

-(int)getWorthForName:(NSString*)name{
    int worth = 0;
    const char* c = [name cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i = 0; i <name.length; i++) {
        worth += c[i]-96;
    }
    return worth;
}

-(void)solve{
    long sum = 0;
    NSArray *names = [self getNames];
    names = [names sortedArrayUsingSelector:@selector(compare:)];
    int position = 0;
    for (NSString *n in names) {
        int worth = [self getWorthForName:n];   
        sum += worth * ++position;
    }
    EULog(@"Answer: %ld",sum);
}
@end
