//
//  Problem54.m
//  GTest
//
//  Created by Constantine Fry on 2/14/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem54.h"

@interface Person : NSObject
@property (nonatomic,assign)int highestPaiValue;
@property (nonatomic,assign)int*vls;
@property (nonatomic,assign)int*suits;
@end

@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        _vls = malloc(sizeof(int)*15);
        _suits = malloc(sizeof(int)*4);
        memset(_vls, 0, 15*sizeof(int));
        memset(_suits, 0, 4*sizeof(int));
    }
    return self;
}

- (void)dealloc
{
    free(self.vls);
    free(self.suits);
}

@end




@implementation Problem54
//8C TS KC 9H 4S 7D 2S 5D 3S AC
-(Person*)convertToCards:(NSArray*)array s:(int)s e:(int)e{
    Person *per = [[Person alloc]init];

    for (int i = s; i <= e; i++) {
        NSString *c = array[i];
        const char *cc = [c cStringUsingEncoding:NSUTF8StringEncoding];

        switch (cc[0]) {
            case 'A':
                per.vls[14]++;
                break;
            case 'K':
                per.vls[13]++;
                break;
            case 'Q':
                per.vls[12]++;
                break;
            case 'J':
                per.vls[11]++;
                break;
            case 'T':
                per.vls[10]++;
                break;
            default:
                per.vls[cc[0] - '0']++;
                break;
                
        }
        
        switch (cc[1]) {
            case 'C':
                per.suits[0]++;
                break;
            case 'H':
                per.suits[1]++;
                break;
            case 'S':
                per.suits[2]++;
                break;
            case 'D':
                per.suits[3]++;
                break;
                
            default:
                break;
        }
    }
    return per;
}

-(NSArray*)parseCards{
    NSString *input = [self openFileWithName:@"poker.txt"];
    NSArray *a = [input componentsSeparatedByString:@"\n"];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:a.count];
    for (NSString *str in a) {
        NSArray *cardCodes = [str componentsSeparatedByString:@" "];
        Person *p1 = [self convertToCards:cardCodes s:0 e:4];
        Person *p2 = [self convertToCards:cardCodes s:5 e:9];
        [result addObject:@[p1,p2]];
    }
    
    return result;
}

-(BOOL)isSameSuit:(Person*)per{
    for (int i = 0; i<=3; i++)
        if (per.suits[i] == 5)
            return  YES;
    
    return NO;
}

-(BOOL)isConsecutive:(Person*)per{
    int cc = 0;
    for (int i = 2; i<=14; i++)
        if (per.vls[i] == 1){
            cc++;
            if (cc==5) {
                return YES;
            }
        }
        else if(per.vls[i]==0 && cc>0)
            return NO;
    
    return NO;
}

-(BOOL)isRoyalFlush:(Person*)per{
    if (per.vls[10] && per.vls[11] && per.vls[12] && per.vls[13] && per.vls[14] )
        return YES;
    return NO;
}

//High Card: Highest value card.

//Three of a Kind: Three cards of the same value.




-(int)calc:(Person*)per{
    BOOL sameSuit = [self isSameSuit:per];
    BOOL consecutive = [self isConsecutive:per];
    if (sameSuit && consecutive) {
        if ([self isRoyalFlush:per])
            return 10;//Royal Flush
        else
            return 9;//Straight Flush
    }else if (sameSuit && !consecutive) {
        return 6;//Flush
    }else if (!sameSuit && consecutive){
        return 5;//Straight
    }

    for (int i = 2; i<=14; i++) {
        if (per.vls[i]==4) {
            per.highestPaiValue = i;
            return 8;//Four of a Kind
        }
        if (per.vls[i]==3) {
            for (int j = 2; j<=14; j++) {
                if (per.vls[j] == 2) {
                    per.highestPaiValue = MAX(i, j);
                    return 7;//Full House
                }
            }
            per.highestPaiValue = i;
            return 4;//Three of a Kind
        }
    }
    
    for (int i = 2; i<=14; i++) {
        if (per.vls[i]==2) {
            for (int j = 2; j<=14; j++)
                if (per.vls[j] == 2 && j!=i){
                    per.highestPaiValue = MAX(i, j);
                    return 3;
                }
            per.highestPaiValue = i;
            return 2;//one pair
        }
    }
    
    
    return 1;
    
}

-(void)solve{
    int res = 0;
    int unk = 0;

    NSArray *cards = [self parseCards];
    for (NSArray *part in cards) {
        c++;
        Person *p1 = part[0];
        Person *p2 = part[1];
        int pointL = [self calc:p1];
        int pointR = [self calc:p2];
        if (pointL > pointR) {
            res++;
        }
        if (pointL == pointR) {
            if (pointR == 2 ||pointR == 3 || pointR==4||pointR == 7||pointR==8) {
                pointL = p1.highestPaiValue;
                pointR = p2.highestPaiValue;
            }
        }else{
            continue;
        }
        
        if (pointL > pointR) {
            res++;
            continue;
        }
        
        if (pointL == pointR) {

            for (int i = 14; i>=2; i--) {
                if (p1.vls[i] && p2.vls[i]) {
                    continue;
                }
                if (p1.vls[i] > 0 && p2.vls[i] == 0) {
                    res++;
                    break;
                }
                if (p1.vls[i] ==0 && p2.vls[i]>0) {
                    break;
                }
            }
        }
    }
    EULog(@"%d %d",res,unk);
}


@end
