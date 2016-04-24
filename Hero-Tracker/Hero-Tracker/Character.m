//
//  Character.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "Character.h"

@implementation Character

+ (Character *)characterWithDictionary:(NSDictionary *)characterDictionary {
    
    Character *aCharacter = nil;
    if (characterDictionary) {
        aCharacter = [[Character alloc] init];
        aCharacter.name = characterDictionary[@"name"];
        aCharacter.firstName = characterDictionary[@"firstName"];
        aCharacter.middleName = characterDictionary[@"middleName"];
        aCharacter.lastName = characterDictionary[@"lastName"];
        aCharacter.height = characterDictionary[@"height"];
        aCharacter.weight = characterDictionary[@"weight"];
        aCharacter.powers = characterDictionary[@"powers"];
        aCharacter.abilities = characterDictionary[@"abilities"];
        aCharacter.smallImage = characterDictionary[@"smallImage"];
        aCharacter.largeImage = characterDictionary[@"largeImage"];
    }
    
    return aCharacter;
    
}

@end
