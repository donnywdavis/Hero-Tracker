//
//  Hero.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDictionary {
    
    Hero *aHero = nil;
    if (heroDictionary) {
        aHero = [[Hero alloc] init];
        aHero.name = heroDictionary[@"name"];
        aHero.firstName = heroDictionary[@"firstName"];
        aHero.middleName = heroDictionary[@"middleName"];
        aHero.lastName = heroDictionary[@"lastName"];
        aHero.height = heroDictionary[@"height"];
        aHero.weight = heroDictionary[@"weight"];
        aHero.powers = heroDictionary[@"powers"];
    }
    
    return aHero;
    
}

@end
