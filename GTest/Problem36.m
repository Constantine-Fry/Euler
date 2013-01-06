//
//  Problem36.m
//  ;;
//
//  Created by Constantine Fry on 12/20/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem36.h"

@implementation Problem36{
    int result;
}

-(void)checkNum:(unsigned int)n{
//    EULog(@"%d",n);
//    if (n>1000000) {
//        return;
//    }
    int numOfBits = sizeof(int)*8;
    int mostLeft = 1 << (numOfBits-1);//0x80000000
    int c = n;
    int count = 0;
    while ((mostLeft & c) != mostLeft) {
        c = c<<1;
        count++;
    }
    
    int numLen = (numOfBits - count);
    int z = numLen/2;

    BOOL ok = YES;

    for (int j = 1; j<=z; j++) {
        int f = numOfBits - j;
        int ff = numOfBits - (numLen - j+1);
        int q = n << f >> (numOfBits-1);
        int qq = n << ff >> (numOfBits-1);
        if ((q != qq)) {
            ok = NO;
            break;
        }
    }
    if (ok) {
        result += n;
        NSMutableString *str = [NSMutableString stringWithCapacity:10];
        for (int i = 1; i<= numLen; i++) {
            [str appendFormat:@"%d",n<<numOfBits-i>>numOfBits-1];
        }
        EULog(@"%d - %d %@",n,numOfBits - count,str);
    }
}



-(void)solve{
//    [self checkNum:585];
//    return;
    result = 0;
    for (int i = 1; i<= 9; i++) {
        [self checkNum:i];
    }
    for (int i = 1; i<= 999; i++) {
        int mirror = 0;
        int a = i;
        int zeros = 1;
        while (a) {
            mirror = mirror*10+a%10;
            a/=10;
            zeros*=10;
        }
        int n = i * zeros+mirror;
        [self checkNum:n];
        

        if (i>=100) {
            continue;
        }
        
        for (int j = 0; j<=9; j++) {
            int n = i * zeros*10 + j*zeros + mirror;
            [self checkNum:n];
        }


    }
    EULog(@"%d",result);
}


//33 - 6 100001
//313 - 9 100111001
//585 - 10 1001001001
//717 - 10 1011001101
//99 - 7 1100011
//15351 - 14 11101111110111
//32223 - 15 111110111011111
//39993 - 16 1001110000111001
//53235 - 16 1100111111110011
//53835 - 16 1101001001001011
//73737 - 17 10010000000001001
//7447 - 13 1110100010111
//9009 - 14 10001100110001
//585585 - 20 10001110111101110001
@end
