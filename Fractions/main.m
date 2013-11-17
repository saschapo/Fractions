//
//  main.m
//  Fractions
//
//  Created by Sasha Ponomarev on 07/11/13.
//  Copyright (c) 2013 Sasha Ponomarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc]initWithFraction: @"-3   / 4"];
        Fraction *f2 = [[Fraction alloc]initWithFraction: @"4/3d d"];
        Fraction *f3 = [[Fraction alloc]init];
//        f3 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/saschapo/Desktop/FracSave.plist"];
        NSLog(@"INITED WITH f3 = %@", [f3 print]);
        [f3 multiply:f1 at:f2];
        NSLog(@"%@ * %@ = %@", [f1 print], [f2 print], [f3 print]);
        [f3 add:f1 to:f2];
        NSLog(@"%@ + %@ = %@", [f1 print], [f2 print], [f3 print]);
        [f3 divide:f1 on:f2];
        NSLog(@"%@ / %@ = %@", [f1 print], [f2 print], [f3 print]);
        [f3 substract:f1 from:f2];
        NSLog(@"%@ - %@ = %@", [f1 print], [f2 print], [f3 print]);
        [NSKeyedArchiver archiveRootObject:f3 toFile:@"/Users/saschapo/Desktop/FracSave.plist"];
    }
    return 0;
}