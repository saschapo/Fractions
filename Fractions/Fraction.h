//
//  Fraction.h
//  Fractions
//
//  Created by Sasha Ponomarev on 07/11/13.
//  Copyright (c) 2013 Sasha Ponomarev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject


-(NSString*)print;
-(void)setNumerator: (int) n;
-(void)setDenominator: (int) d;
-(int)numerator;
-(int)denominator;
-(void)simplify;
-(void)add: (Fraction*) fr1 to: (Fraction*) fr2;
-(void)multiply: (Fraction*) fr1 at: (Fraction*) fr2;
-(void)divide: (Fraction*) fr1 on: (Fraction*) fr2;
-(void)substract: (Fraction*) fr1 from: (Fraction*) fr2;
-(void)set: (NSString*)stringFrac;
-(BOOL)isFraction: (NSString*)stringFrac;
-(id)initWithFraction: (NSString*) str;

@end