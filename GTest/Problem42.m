//
//  Problem42.m
//  GTest
//
//  Created by Constantine Fry on 12/21/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem42.h"

@implementation Problem42{
    NSArray *_words;
    NSMutableDictionary *_dic;
    int max;
}

-(NSArray*)getWords{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words"
                                                     ofType:@"txt"];
    NSString *input = [NSString stringWithContentsOfFile:path
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    NSArray *a = [input componentsSeparatedByString:@","];
    return a;
}
- (id)init
{
    self = [super init];
    if (self) {
        _words = [self getWords];
        _dic = [NSMutableDictionary dictionaryWithCapacity:100];
        _dic[@(1)] = @(1);
        max = 1;
        
    }
    return self;
}

-(BOOL)isTriangleNumber:(int)num{
    if (num <= max) {
        return _dic[@(num)]!=nil;
    }
    int limit = max+300;
    for (int i = max; i<=limit; i++) {
        int tr = 0.5*i*(i+1);
        _dic[@(tr)] = @"";
        max = i;
        if (num == tr) {
            
            return YES;
        }
    }
    return NO;
}

-(void)solve{
    int res = 0;
    for (NSString *word in _words) {
        const char* a= [word UTF8String];
        int sum = 0;
        for (int i = 0 ; i<word.length; i++) {
            sum+= a[i]-64;
        }
        if([self isTriangleNumber:sum]){
            res++;
        }
    }
    EULog(@"%d",res);
}
@end
