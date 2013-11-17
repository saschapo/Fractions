//
//  Fraction.m
//  Fractions
//
//  Created by Sasha Ponomarev on 07/11/13.
//  Copyright (c) 2013 Sasha Ponomarev. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction{
    int numerator;
    int denominator;
}


-(void) encodeWithCoder: (NSCoder *) coder {
    NSNumber *numBox = [NSNumber numberWithInt:numerator];
    NSNumber *denBox = [NSNumber numberWithInt:denominator];
    [coder encodeObject:numBox forKey:@"FracNUM"];
    [coder encodeObject:denBox forKey:@"FracDEN"];
}


- (id)initWithFraction: (NSString*) str {
    self = [super init];
    if (self) {
        [self set: str];
    }
    return self;
}

-(id) initWithCoder: (NSCoder*) coder {
    numerator = (int) [[coder decodeObjectForKey:@"FracNUM"] integerValue];
    denominator = (int) [[coder decodeObjectForKey:@"FracDEN"] integerValue];
    return self;
}

-(NSString*)print {
    return [NSString stringWithFormat:@"%i/%i", numerator, denominator];
}

-(void)setNumerator: (int) n {
    numerator = n;
}

-(void)setDenominator: (int) d {
    denominator = d;
}

-(void)simplify {
    int maxCycles = 0;
    maxCycles = (numerator > denominator) ? numerator : denominator;
    for (int i = 2; i <= maxCycles-1; ++i) {
        while (numerator%i == 0 && denominator%i == 0) {
            numerator /= i;
            denominator /= i;
        }
    }
}

-(int)numerator {
    return numerator;
}

-(int)denominator {
    return denominator;
}

-(void)add: (Fraction*) fr1 to: (Fraction*) fr2 {
    numerator = [fr1 numerator] * [fr2 denominator] + [fr1 denominator] * [fr2 numerator];
    denominator = [fr1 denominator] * [fr2 denominator];
    [self simplify];
}

-(void)multiply: (Fraction*) fr1 at: (Fraction*) fr2 {
    numerator = [fr1 numerator] * [fr2 numerator];
    denominator = [fr1 denominator] * [fr2 denominator];
    [self simplify];
}

-(void)divide: (Fraction*) fr1 on: (Fraction*) fr2 {
    numerator = [fr1 numerator] * [fr2 denominator];
    denominator = [fr1 denominator] * [fr2 numerator];
    [self simplify];
}

-(void)substract: (Fraction*) fr1 from: (Fraction*) fr2 {
    numerator = [fr1 numerator] * [fr2 denominator] - [fr1 denominator] * [fr2 numerator];
    denominator = [fr1 denominator] * [fr2 denominator];
    [self simplify];
}

-(BOOL)isFraction: (NSString*)stringFrac {
    NSRange range = [stringFrac rangeOfString:@"/"];
    if (range.location != NSNotFound)
    {
        return YES;
    }
    return NO;
}

-(void)set: (NSString*)stringFrac {
    if ([self isFraction:stringFrac]) {
        NSRange slashPosition = [stringFrac rangeOfString:@"/"];
        numerator = [[stringFrac substringToIndex:slashPosition.location] intValue];
        denominator = [[stringFrac substringFromIndex:slashPosition.location+1] intValue];
        [self simplify];
    }
    else{
        numerator = 1;
        denominator = 1;
    }
}
@end